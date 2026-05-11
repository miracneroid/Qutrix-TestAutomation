*** Settings ***
Resource    ../resources/keywords.robot

Suite Setup       Open Browser To Qutrix
Suite Teardown    Close Automation Browser

*** Test Cases ***

Navigate And Capture Self Assessment Screenshot
    [Documentation]    Opens qutrix.io and captures self-assessment screenshot

    Navigate To Careers Page

    Open Self Assessment Page

    Capture Assessment Screenshot