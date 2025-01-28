*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}      D:/ChromeForTesting/chrome.exe
${CHROME_DRIVER_PATH}       D:/ChromeForTesting/chromedriver.exe
${URL}                      https://www.kku.ac.th

*** Test Cases ***
TC_001: Start Chrome For Testing
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}

