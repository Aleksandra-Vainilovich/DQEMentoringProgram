# Environment setup

python3 install
PyCharm optional
pip install great_expectations
pip install sqlalchemy
pip install pyodbc

Import great_expectations

Download and install SQL Server from the official Microsoft page
Install SQL Server + add the local DB feature

## Create SQL Server DB
	Connect to your local DB under administrator user
	Select [master] database
	Copy-paste the script from attachments and execute it.

## Create user for the connection - 
	https://www.tutorialspoint.com/ms_sql_server/ms_sql_server_create_users.htm
	https://www.youtube.com/watch?v=AqZGjJ1OKu0
	Restart MS SQL server after user creation

## Go to SQL Server Server Properties -> Security -> 
	Cange 'Windows Authentication mode' to 'SQL Server and Windows Authentication mode'
	Restart MS SQL server after user change

## Open Sql Server Configuration Manager
	Go to SQL Server Network Configuration -> Protocols for MSSQLSERVER -> enable TCP/IP protocol
	Go to SQL Server Services -> Restart SQL Server (should be done after user creation)

# Working with Great Expectations

Warning: Before moving forward, close the browser tab with the notebook, return to your terminal, and 
	press CTRL+C to shut down the running notebook server before proceeding.

## Test cases

### In command Prompt/Pycharm Terminal run: 
	 great_expectations init 
	 great_expectations datasource new -> configure:
		connection_string = "mssql+pyodbc://User_name:User_Password@Server_Name:1433/DB_name?driver=ODBC Driver 17 for SQL Server&charset=utf&autocommit=true"
		connection_string = "mssql+pyodbc://User_name:User_Password@Server_Name:1433/DB_name"
	 great_expectations suite new -> configure:
		Create expectation suite Manually
	 great_expectations --v3-api suite edit suite_name -> configure:
		Interactively
		default_configured_data_connector_name
		configure Jupyter Notebook page accordingly

	Expected result:
		html page with Test Result report

## Checkpoints

### In command Prompt/Pycharm Terminal run: 
	great_expectations --v3-api checkpoint new checkpoint_name
		configure Jupyter Notebook page accordingly
	great_expectations --v3-api checkpoint run checkpoint_name

	Expected result:
		Existed test cases are run and result is reported.