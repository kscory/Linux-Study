# !/bin/bash

## 인자 전달하기
echo $0
echo $1
echo $2
# @는 인자 전부
echo $@
# #은 인자의 개수
echo $#


## read의 활용
while :
do
    read key
    echo "your pressed $key"
    if [ $key = "end" ] ; then
        break
    fi
done


## select 의 활용
select option in CODE DIE
do
    echo "your pressed $option"
        break
done
