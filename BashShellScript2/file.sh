# !/bin/bash

## 파일 읽기
while read line
do
	echo "$i: $line"
	i=`expr $i + 1`
done <$1