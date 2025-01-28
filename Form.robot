*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}                 http://localhost:7272/Form.html
${BROWSER}                  Chrome
${FIRST_NAME}               Somsong
${LAST_NAME}                Sandee
${DESTINATION}              Europe
${CONTACT_PERSON}           Sodsai Sandee
${RELATIONSHIP}             Mother
${VALID_EMAIL}              somsong@kkumail.com
${INVALID_EMAIL}            somsong@
${PHONE_NO}                 081-111-1234
${INVALID_PHONE}            191
${ERROR_MSG_DESTINATION}    *Please enter your destination.
${ERROR_MSG_EMAIL}          *Please enter a valid email address.
${ERROR_MSG_PHONE}          *Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678.
${CHROMEDRIVER_PATH}        ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe

*** Test Cases ***
TC001 Open Form
    [Documentation]  เปิดเว็บไซต์และตรวจสอบการแสดงแบบฟอร์ม
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Title Should Be   Customer Inquiry
    Page Should Contain   Travel Insurance Inquiry
    Close Browser

TC002 Valid Input
    [Documentation]   ทดสอบเมื่อกรอกข้อมูลครบทุกช่องถูกต้อง และตรวจสอบว่าไม่มีข้อความแสดงข้อผิดพลาด
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text         id=firstname        ${FIRST_NAME}
    Input Text         id=lastname         ${LAST_NAME}
    Input Text         id=destination      ${DESTINATION}
    Input Text         id=contactperson    ${CONTACT_PERSON}
    Input Text         id=relationship     ${RELATIONSHIP}
    Input Text         id=email            ${VALID_EMAIL}
    Input Text         id=phone            ${PHONE_NO}
    Click Button       id=submitButton
    Page Should Not Contain   ${ERROR_MSG_DESTINATION}
    Page Should Not Contain   ${ERROR_MSG_EMAIL}
    Page Should Not Contain   ${ERROR_MSG_PHONE}
    Close Browser

TC003 Empty Destination
    [Documentation]  ทดสอบเมื่อไม่กรอกข้อมูลช่อง Destination และตรวจสอบข้อความแสดงข้อผิดพลาด
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text      id=firstname       ${FIRST_NAME}
    Input Text      id=lastname        ${LAST_NAME}
    Input Text      id=contactperson   ${CONTACT_PERSON}
    Input Text      id=relationship    ${RELATIONSHIP}
    Input Text      id=email           ${VALID_EMAIL}
    Input Text      id=phone           ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain   ${ERROR_MSG_DESTINATION}
    Close Browser

TC004 Empty Email
    [Documentation]  ทดสอบเมื่อไม่กรอกข้อมูลช่อง Email และตรวจสอบข้อความแสดงข้อผิดพลาด
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text      id=firstname       ${FIRST_NAME}
    Input Text      id=lastname        ${LAST_NAME}
    Input Text      id=destination     ${DESTINATION}
    Input Text      id=contactperson   ${CONTACT_PERSON}
    Input Text      id=relationship    ${RELATIONSHIP}
    Input Text      id=phone           ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain   ${ERROR_MSG_EMAIL}
    Close Browser

TC005 Invalid Email
    [Documentation]  ทดสอบเมื่อกรอกข้อมูล Email ไม่ถูกต้อง และตรวจสอบข้อความแสดงข้อผิดพลาด
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text      id=firstname       ${FIRST_NAME}
    Input Text      id=lastname        ${LAST_NAME}
    Input Text      id=destination     ${DESTINATION}
    Input Text      id=contactperson   ${CONTACT_PERSON}
    Input Text      id=relationship    ${RELATIONSHIP}
    Input Text      id=email           ${INVALID_EMAIL}
    Input Text      id=phone           ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain   ${ERROR_MSG_EMAIL}
    Close Browser

TC006 Empty Phone Number
    [Documentation]  ทดสอบเมื่อไม่กรอกข้อมูลช่อง Phone Number และตรวจสอบข้อความแสดงข้อผิดพลาด
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text      id=firstname       ${FIRST_NAME}
    Input Text      id=lastname        ${LAST_NAME}
    Input Text      id=destination     ${DESTINATION}
    Input Text      id=contactperson   ${CONTACT_PERSON}
    Input Text      id=relationship    ${RELATIONSHIP}
    Input Text      id=email           ${VALID_EMAIL}
    Click Button    id=submitButton
    Page Should Contain   ${ERROR_MSG_PHONE}
    Close Browser

TC007 Invalid Phone Number
    [Documentation]  ทดสอบเมื่อกรอกข้อมูล Phone Number ไม่ถูกต้อง และตรวจสอบข้อความแสดงข้อผิดพลาด
    Open Browser    ${BASE_URL}    ${BROWSER}    service.executable_path=${CHROMEDRIVER_PATH}
    Input Text      id=firstname       ${FIRST_NAME}
    Input Text      id=lastname        ${LAST_NAME}
    Input Text      id=destination     ${DESTINATION}
    Input Text      id=contactperson   ${CONTACT_PERSON}
    Input Text      id=relationship    ${RELATIONSHIP}
    Input Text      id=email           ${VALID_EMAIL}
    Input Text      id=phone           ${INVALID_PHONE}
    Click Button    id=submitButton
    Page Should Contain   ${ERROR_MSG_PHONE}
    Close Browser
