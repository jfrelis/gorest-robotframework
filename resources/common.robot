*** Settings ***
Library    dotenv_loader.py

*** Keywords ***
Load Env
    ${token}=    Load Access Token
    Set Global Variable    ${ACCESS_TOKEN}    ${token}
