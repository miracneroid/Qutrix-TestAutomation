*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Library    String

*** Variables ***
${BROWSER}           Chrome
${URL}               https://qutrix.io
${SCREENSHOT_PATH}   screenshots/qutrix_self_assessment.png

*** Keywords ***

Open Browser To Qutrix
    Log To Console    \nOpening browser and navigating to Qutrix...
    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Set Selenium Timeout    10s
    Set Selenium Speed      0.2s

    Wait Until Page Contains Element    tag:body

Capture Current IP
    Log To Console    \nDetecting Operating System...

    ${os}=    Evaluate    platform.system()    modules=platform

    IF    '${os}' == 'Windows'
        ${result}=    Run Process    ipconfig    shell=True
    ELSE
        ${result}=    Run Process    ifconfig    shell=True
    END

    ${output}=    Set Variable    ${result.stdout}

    ${matches}=    Get Regexp Matches
    ...    ${output}
    ...    (?:inet\\s)(?:addr:)?([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)

    ${ip}=    Set Variable    ${matches}[0]

    Log To Console    \nIP Address: ${ip}

Navigate To Careers Page
    Log To Console    \nNavigating to Careers section...

    Wait Until Element Is Visible    xpath=//a[contains(.,'Company')]    15s
    Click Element    xpath=//a[contains(.,'Company')]

    Wait Until Element Is Visible    xpath=//a[contains(.,'Career')]    15s
    Click Element    xpath=//a[contains(.,'Career')]

    Wait Until Page Contains    Self-Assessment    15s

Open Self Assessment Page
    Log To Console    \nOpening Self Assessment page...

    Scroll Element Into View    xpath=//*[contains(text(),'Click Here')]

    Wait Until Element Is Visible    xpath=//*[contains(text(),'Click Here')]    15s

    Click Element    xpath=//*[contains(text(),'Click Here')]

    Sleep    2s

    Switch Window    NEW

Capture Assessment Screenshot
    Log To Console    \nCapturing screenshot...

    Wait Until Page Contains Element    tag:body    15s

    Capture Page Screenshot    ${SCREENSHOT_PATH}

    Log To Console    \nScreenshot saved successfully.

Close Automation Browser
    Log To Console    \nClosing browser...
    Close Browser