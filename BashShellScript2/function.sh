# !/bin/bash

## 함수의 선언 및 사용
# 기본
function hello() {
    echo "hello"
}
hello

# function은 생략 가능
hello2() {
    echo "hello $1 and $2"
}
hello2 world Foo!


## 함수 내 변수 선언 및 사용
hello3() {
    echo "hello $1 and $2"
    local i=5
    j=6
    echo $i
    echo $j
}

hello3 world Foo333
echo $i
echo $j
