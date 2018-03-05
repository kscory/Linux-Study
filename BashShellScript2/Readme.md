# Bash Shell Script 2
  - 반복문
  - 인자 전달
  - 파일 입출력
  - 함수

---

## 반복문
  ### 1. while을 이용한 반복
  - `while [ 조건문 ]` 으로 사용
  - `do ~ done` 까지 부분을 조건이 성립할때까지 반복

  ```bash
  ## while을 이용한 반복
  i=0
  while [ $i -lt 10 ]
  do
    i=`expr $i + 1`
    echo $i
  done

  ```

  ### 2. 무한루프(while :) (continue, break)
  - `while :` 이용시 do ~ done 부분을 무한으로 반복
    - `continue` 가 있으면 다음으로 넘어감
    - `break` 가 있을경우 이를 종료

  ```bash
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
  ```

  ### 3. for 을 이용한 반복
  - `for 변수 in 리스트` 형식으로 사용
  - do ~ done 까지 부분을 조건이 성립할때까지 반복
  - seq 문을 이용하면 seq [시작] [끝] 까지 순증가

  ```bash
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
  ```
---

## 인자 전달 및 입력
  ### 1. 쉘에서 인자를 받아 처리
  - 쉘안에 인자를 첫번째 `$0`, 두번째 `$1`, … 식으로 인자를 전달
  - `@` 는 인자 전체를 나타냄
  - `#` 는 인자의 갯수를 나타냄
  - 실행을 `./send.sh a b c d` 와 같이 하여 인자를 전달

  ```bash
  ## 인자 전달하기 (./send.sh a b c d 로 실행한 경우)
  echo $0         # 출력 : a
  echo $1         # 출력 : b
  echo $2         # 출력 : c

  # @는 인자 전부
  echo $@         # 출력 : a b c d

  # #은 인자의 개수
  echo $#         # 출력 : 4
  ```

  ### 2. read 의 활용
  - read 변수로 해서 사용자로부터 인자를 전달 받을 수 있다.
  - 변수와 조건을 사용해서 입력 받은 인자를 처리할 수 있다.

  ```bash
  while :
  do
    read key
    echo "your pressed $key"
    if [ $key = "end" ] ; then
      break
    fi
  done
  # 입력을 end를 하면 종료됨
  ```

  ### 3. select의 활용
  - select 는 숫자로 선택할 수 있는 입력을 받는다.
  - `select 변수 in [1. 조건] [2. 조건] [3. 조건] …` 과 같이 이용

  ```bash
  select option in CODE DIE
  do
    echo "your pressed $option"
    break
  done
  # 1 입력시 CODE, 2 입력시 DIE 를 출력
  ```
---

## 파일 읽기
  ### 1. 파일 읽기
  - 쉘을 실행할 때 `./file.sh context.txt` 와 같이 "[쉘] [파일]" 로 파일의 내용을 입력으로 사용 가능
  - line 이라는 변수를 사용하면 파일의 내용을 한 줄 씩 읽는다.
  - line 변수와 $1 (파일명이 첫번째 인자로 전달)을 사용해서 파일 내용이 끝까지 반복 가능하다.

  ```bash
  i=1
  while read line
  do
      echo "$i: $line"
      i=`expr $i + 1`
  done <$1

  ```
---

## 함수
  ### 1. 함수의 선언 및 사용
  - `function 함수 명 ()` 으로 선언 (funntion은 생략가능), 함수 내용은` { xxx }` 로 안에 함수 내용을 정의해서 사용
  - 함수를 부를 때는 `함수명 변수1 변수2 ...` 로 부름
  - 함수 내에 함수 인자를 사용할 때는 $1, $2 식으로 정의해서 사용

  ```bash
  # 기본
  function hello() {
      echo "hello"
  }
  hello               # 출력 : hello

  # function은 생략 가능
  hello2() {
      echo "hello $1 and $2"
  }
  hello2 world Foo!   # 출력 : hello world Foo!
  ```

  ### 2. 함수 내 변수 선언 및 사용
  - 함수 내에서 지역변수를 사용할 경우 `local` 을 사용
    - 지역변수로 선언되면 함수 밖에서 이 변수를 이용할 수 없다.
  - 함수 내에서 변수를 선언하고 사용하고 싶을 경우 같은 반법으로 `$` 를 사용

  ```bash
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

  # 출력
  # hello world Foo333
  # 5
  # 6
  #
  # 6
  ```

---
