*** Settings ***
Resource    ../resources/keywords.robot

*** Test Cases ***

Capture And Print IP Address
    [Documentation]    Captures and prints system IP address automatically
    Capture Current IP