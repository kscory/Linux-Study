# !/bin/bash

## 변수의 선언

# 변수 선언은 '='을 사용하며 앞뒤 스페이스가 없는 것에 주의
s="hello "

# s 변수값을 출력
echo $s
echo "$s"
echo "${s}"

# s 변수값을 연이어 출력
echo $s$s

# s 변수값과 공백" " s 변수값을 출력
echo "$s $s"

# ''는 '와 '로 묶인 내용을 그대로 출력
echo '$s'


## 산술
x=10

# x 변수값을 출력
echo $x

# $x+2 를 사용하려면 +2라는 문자를 출력, 결과 아님
# 변수를 사용해서 계산 결과를 출력하려면 expr 와 `를 사용
echo $x + 2
echo `expr $x + 2`

# 사칙 연산 중 +,-,/ 는 연산자 그대로, *는 \*로 바꿔서 사용
echo `expr $x + 2`
echo `expr $x - 2`
echo `expr $x / 2`
echo `expr $x \* 2`

# "(" 혹은 ")" 를 사용할 때도 \를 사용
echo `expr 2 \* \( $x + 5 \)`


## 읽기 전용 속성
readonly FILE_NAME="fast.sh"