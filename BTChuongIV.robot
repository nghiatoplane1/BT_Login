*** Settings ***
Documentation   VietTestCaseTrangLogin
Library      SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}       admin
${PASSWORD}       admin123
${USERNAME_INVALID}    admin
${PASSWORD_INVALID}    admin123456

*** Test Cases ***
ĐăngNhập
    # Mở trình duyệt
    Mở trình duyệt
    # Đăng nhập với thông tin hợp lệ
    Đăng nhập    ${USERNAME}    ${PASSWORD}
    # Kiểm tra đăng nhập thành công
    Kiểm tra đăng nhập thành công
    # Đăng xuất
    Đăng xuất
    # Đóng trình duyệt
    Đóng trình duyệt
ĐăngNhậpKhôngHợpLệ
    # Mở trình duyệt
    Mở trình duyệt
    # Đăng nhập với thông tin không hợp lệ
    Đăng nhập    ${USERNAME_INVALID}    ${PASSWORD_INVALID}
    # Kiểm tra đăng nhập không thành công
    Kiểm tra đăng nhập không thành công
    # Đóng trình duyệt
    Đóng trình duyệt
*** Keywords ***
Mở trình duyệt
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    10s
Đăng nhập
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button  xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
Kiểm tra đăng nhập thành công
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6  timeout=10s
    Element Should Be Visible    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Log To Console    Đăng nhập thành công
Kiểm tra đăng nhập không thành công
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div[1]/div[1]/div[1]/p  timeout=10s
    Element Should Be Visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div[1]/div[1]/div[1]/p
    Log To Console    Đăng nhập không thành công
Đăng xuất
    Click Element    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/span
    Click Element    xpath=//*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/ul/li[4]/a
    Wait Until Element Is Visible    name=username    timeout=5s
    Element Should Be Visible        name=username
    Log To Console    Đăng xuất thành công
Đóng trình duyệt
    Close Browser