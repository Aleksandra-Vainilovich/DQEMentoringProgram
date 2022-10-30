# Environment setup

python3 install
PyCharm optional
pip install pytest
pip install pyodbc
Download and install SQL Server from the official Microsoft page
Install SQL Server + add the local DB feature
	


## Create SQL Server DB
	Connect to your local DB under administrator user
	Select [master] database
	Copy-paste the script from attachments and execute it.

## Create user for the connection - https://www.tutorialspoint.com/ms_sql_server/ms_sql_server_create_users.htm
	Restart MS SQL server after user creation

## Open Sql Server Configuration Manager
	Go to SQL Server Network Configuration -> Protocols for MSSQLSERVER -> enable TCP/IP protocol
	Go to SQL Server Services -> Restart SQL Server (should be done after user creation)

## Clone Module4ProjectPyTest repository from https://github.com/Aleksandra-Vainilovich/DQEMentoringProgram


# Tests execution

## Run PyTest tests

Open ..Module4ProjectPyTest\Module4PyTest\TestPyTest.py
Change connection parameters in accordance with environment used.

Working from PyCharm go to 
	File -> settings -> Project:Module4ProjectPyTest -> Python Interpreter -> press '+' -> choose PyTest-HTML -> Install Package

Working from PyCharm go to Terminal from ..Module4ProjectPyTest\Module4PyTest\TestPyTest.py
pytest -v -s Module4PyTest\TestPyTest.py --html=report.html
Expected result: 
	all tests have status PASS
	link to report is generated


## Check reports
Report file is created automatically in 
	..\Module4ProjectPyTest\report.html
	..\Module4ProjectPyTest\pytest_html_report.html


