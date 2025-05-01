*** Settings ***
Documentation    Hàm dựng sẵn cho keywords
Library    SeleniumLibrary
*** Variables ***
${x}    10
${y}    10
@{bangchucai}    a    b    c    d    e    f    g    h    i    j   k    l    m    n
*** Test Cases ***
so sánh 2 biến
    Should Be Equal    ${x}    ${y}

Điều kiện
    IF    ${x} == ${y}
        Log To Console   Hai biến bằng nhau
    ELSE
        Log To Console   Hai biến không bằng nhau
    END

Vòng lặp
    FOR    ${i}    IN RANGE    10
        Log To Console   ${i}
    END
Vòng lặp với danh sách
    FOR    ${i}    IN    @{bangchucai}
        Log To Console   ${i}
    END

Xử lý lỗi
    TRY
        Click Element    id=btn_login
        Log To Console   Đã click vào nút login
    EXCEPT
        Log To Console   Không thể click vào nút login
    END