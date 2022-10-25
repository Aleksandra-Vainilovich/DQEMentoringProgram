*** Settings ***
Suite Setup  Connect To Database Using Custom Params   pyodbc    ${db_custom_param_string}
Suite Teardown  Disconnect From Database

Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections

*** Variables ***
${DBUser}  Robot_User4
${db_custom_param_string} =  Driver='SQL Server', Server='EPBYMINW6718', Trusted_Connection='yes', TrustServerCertificate='yes', database='TRN_2'

*** Keywords ***
Connect DB
    Connect To Database Using Custom Params  pyodbc  ${db_custom_param_string}

Disconnect DB
    Disconnect From Database