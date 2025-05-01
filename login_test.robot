*** Settings ***
Documentation     VietTestCaseTrangLogin
Library           SeleniumLibrary

*** Variables ***
${URL}            https://the-internet.herokuapp.com/login
${USERNAME}       tomsmith
${PASSWORD}       SuperSecretPassword!
${USERNAME_INVALID}    tomsmith
${PASSWORD_INVALID}    SuperSecretPassword123    

*** Test Cases ***
ĐăngNhập
    # Mở trình duyệt
    Mở trình duyệt
    # Đăng nhập với thông tin hợp lệ
    Đăng nhập    ${USERNAME}    ${PASSWORD}
    # Kiểm tra đăng nhập thành công
    Kiểm tra đăng nhập thành công
    # Đăng nhập với thông tin không hợp lệ
    Đăng nhập    ${USERNAME_INVALID}    ${PASSWORD_INVALID}
    Kiểm tra đăng nhập không thành công
    # Đăng xuất
    Đăng xuất
    # Đóng trình duyệt
    Đóng trình duyệt

*** Keywords ***
Mở trình duyệt
    Open Browser    ${URL}    chrome
    # Mở cửa sổ trình duyệt lớn nhất
    Maximize Browser Window

Đăng nhập
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  xpath=//*[@id="login"]/button

Kiểm tra đăng nhập thành công
    Page Should Contain    Welcome
    Log To Console    Đăng nhập thành công

Kiểm tra đăng nhập không thành công
    Page Should Contain    Your username is invalid!
    Log To Console    Đăng nhập không thành công

Đăng xuất
    Click Button    xpath=//*[@id="content"]/div/a/i
    Page Should Contain Element    id=flash

Đóng trình duyệt
    Close Browser