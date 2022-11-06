import pyodbc
import pytest

drivers = [item for item in pyodbc.drivers()]
driver = drivers[-1]
print("driver:{}".format(driver))

@pytest.fixture(scope='module')
def conn():
    conn = pyodbc.connect('Driver={driver};' #SQLDocker     	DSN=FreeTDS	    SQL Server  ODBC Driver 17 for SQL Server
                      'Server=EPBYMINW6718;'	#tcp:localhost,1433
                      'Database=TRN_2;'
                      'Trusted_Connection=yes;'
                      'TrustServerCertificate=Yes;')
    yield conn
    conn.close()


@pytest.fixture
def cursor(conn):
    cursor = conn.cursor()
    yield cursor
    conn.rollback()


class TestDB:
    def test_verify_a_table_is_present_or_not(self, cursor):
        cursor.execute('SELECT * FROM information_schema.tables WHERE table_name = \'countries\' ')
        res = cursor.fetchall()
        assert len(res) == 1

    def test_verify_the_number_of_rows(self, cursor):
        cursor.execute('SELECT country_id FROM hr.countries')
        res = cursor.fetchall()
        assert len(res) == 25

    def test_check_if_exists_in_hr_employees(self, cursor):
        cursor.execute('SELECT employee_id FROM hr.employees WHERE last_name = \'King\' ')
        res = cursor.fetchall()
        assert len(res) > 0

    def test_check_if_not_exists_in_hr_employees(self, cursor):
        cursor.execute('SELECT employee_id FROM hr.employees WHERE job_id = \'100\' ')
        res = cursor.fetchall()
        assert len(res) == 0

    def test_verify_the_maximum_value_in_hr_dependents_dependent_id(self, cursor):
        cursor.execute('SELECT MAX(dependent_id) dependent_id FROM [hr].[dependents]')
        for res in cursor:
            cursor.fetchall()
        #try:
        assert res[0] == 30, f'maximum value does not match expected value, got: {res[0]}'
        #except Exception as error:
            #print(error)

    def test_verify_the_values_range_for_hr_dependents_dependent_id(self, cursor):
        cursor.execute('SELECT dependent_id FROM [hr].[dependents] WHERE dependent_id BETWEEN 40 AND 100')
        res = cursor.fetchall()
        assert len(res) == 0


run_tests = TestDB()
run_tests


#pytest -v -s Module4PyTest\TestPyTest.py --html=report.html
###pytest Module4PyTest\TestPyTest.py
###py.test --html=Report.html


