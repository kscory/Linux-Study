# !/bin/bash

## while을 이용한 반복
i=0
while [ $i -lt 10 ]
do
	i=`expr $i + 1`
	echo $i
done


## 무한 루프
i=0
while :
do
	i=`expr $i + 1`
    if [ $i -eq 3 ] ; then
        continue
    elif [ $i -gt 10 ] ; then
        break
    fi
    echo $i
done


## for를 이용한 반복
# 값을 그냥 대입
for i in 1 2 3 4 5
do
    echo $i
done

# 배열로 대입
a=(1 2 3 4 5)
for i in ${a[@]}
do
    echo $i
done

# seq 문의 활용
for i in `seq 1 5`
do
    echo $i
done


