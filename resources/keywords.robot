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
        ${output}=    Set Variable    ${result.stdout}

        Log To Console    \n${output}

        ${matches}=    Get Regexp Matches
        ...    ${output}
        ...    ([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)

    ELSE

        ${result}=    Run Process    ifconfig    shell=True
        ${output}=    Set Variable    ${result.stdout}

        ${matches}=    Get Regexp Matches
        ...    ${output}
        ...    inet (?:addr:)?([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)

    END

    Log To Console    \nRaw Matches: ${matches}

    ${ip}=    Set Variable    ${matches}[0]

    Log To Console    \nIP Address: ${ip}

Navigate To Careers Page
    Log To Console    \nNavigating directly to Careers page...

    Go To    https://qutrix.io/careers/

    Wait Until Page Contains Element    tag:body    20s

    Sleep    5s

Open Self Assessment Page
    Log To Console    \nOpening Self Assessment page directly...

    Go To    https://qutrix.io/self-assessment/

    Wait Until Page Contains Element    tag:body    20s

    Sleep    5s

Capture Assessment Screenshot
    Log To Console    \nCapturing screenshot...

    Wait Until Page Contains Element    tag:body    15s

    Capture Page Screenshot    ${SCREENSHOT_PATH}

    Log To Console    \nScreenshot saved successfully.

Close Automation Browser
    Log To Console    \nClosing browser...
    Close Browser