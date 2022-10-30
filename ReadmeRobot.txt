# Environment setup

python3 install
PyCharm optional
pip install robot
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

## Clone Module4ProjectRobot repository from https://github.com/Aleksandra-Vainilovich/DQEMentoringProgram

# Tests execution

## Run robot tests

Open ..Module4ProjectRobot\Module4Robot\DatabaseConnection.robot
Change values in ${db_custom_param_string} corresponding to environment used.


Working from PyCharm go to Terminal from ..Module4ProjectRobot\Module4Robot\DBTests.robot
run command robot Module4Robot\DBTests.robot
Expected result: all tests have status PASS


## Check reports
Report file is created automatically in ..\Module4ProjectRobot\report.html
