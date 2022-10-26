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

## Clone repository from https://github.com/Aleksandra-Vainilovich/DQEMentoringProgram/tree/main


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
copy generated report link an paste it into browser




pip install allure-pytest
download the latest allure package zip file from the allure-framework GitHub repo
Unzip the downloaded zip file
Copy the path till bin
Add it to the path environment variable

pip install pytest-html
pip install pytest-html-reporter
settings -> project -> python Interpreter -> '+' -> PyTest-HTML -> install package
pytest -v -s Module4PyTest\TestPyTest.py --html=report.html
copy link to folder
