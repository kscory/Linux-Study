# !/bin/bash

## 조건 분기
# $? : 바로 직전에 결과가 정상 종료인지 아닌지 출력
test 1 -eq 2; echo $?
# 파일이 있느지 확인
test -e condition.sh; echo $?
# 논리식 사용
test 1 -eq 2 -a 2 -eq 2 ; echo $?


## if, then, elif, else
# if ~ then
x=80
if test $x -gt 60
then
  echo "PASS !"
fi

# elif, else
x=49
if [ $x -gt 60 ] ; then
  echo "PASS !"
elif [ $x -gt 50 ] ; then
  echo "soso..."
else
  echo "Fail."
fi


## case
signal="red"
case $signal in
  "red")
   echo "stop!"
   ;;
  "yellow")
   echo "caution!"
   ;;
  "green")
   echo "go!"
   ;;
  *)
   echo "..."
   ;;
esac
