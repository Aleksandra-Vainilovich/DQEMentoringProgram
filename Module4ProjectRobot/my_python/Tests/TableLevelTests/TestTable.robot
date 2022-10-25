*** Settings ***
Documentation  SQL Tests
Resource  ../TableLevelTests/DatabaseConnection.robot
Test Setup  DatabaseConnection.Connect DB
Test Teardown  DatabaseConnection.Disconnect DB

*** Variables ***
${DBUser}  Robot_User4
${db_custom_param_string} =  Driver='SQL Server', Server='EPBYMINW6718', Trusted_Connection='yes', TrustServerCertificate='yes', database='TRN_2'

*** Test Cases ***
Verify a Table is present or Not
    [Tags]    db    hr      countries
    [documentation]  This test case verifies whether Countries table exist in the database or not
    Table Must Exist  countries
    Log    Test is run by ${DBUser}

Verify the number of rows
    [Tags]    db    hr      countries
    [documentation]  This test case verifies if the number of rows in the table is equal to the expected number
    Row Count Is Equal To X    SELECT country_id FROM hr.countries    25

Check if Exists in hr.employees
    [Tags]    db    hr      employees
    [documentation]  This test case verifies if there is an employee with specified last name in the table
    Check If Exists In Database    SELECT employee_id FROM hr.employees WHERE last_name = 'King';

Check if not Exists in hr.employees
    [Tags]    db    hr      employees
    [documentation]  This test case verifies if there are no rows with undesirable jobs in the table
    Check If Not Exists In Database    SELECT employee_id FROM hr.employees WHERE job_id = '100';

Verify Query: Verify the maximum value in hr.dependents.dependent_id
    [Tags]    db    hr      dependents
    [documentation]  This test case verifies the maximum value for specified field in the table
    ${output} =    Query    SELECT MAX(dependent_id) FROM [hr].[dependents];
    Log    ${output}
    Should Be Equal As Strings    ${output}    [(30, )]

Verify the values range for hr.dependents.dependent_id
    [Tags]    db    hr      dependents
    [documentation]  This test case verifies if there are any rows with undesirable dependent_id in the table
    Row Count Is 0    SELECT dependent_id FROM [hr].[dependents] WHERE dependent_id BETWEEN 40 AND 100;
