# Bash Shell Script 1
  - 기본
  - 변수
  - 배열
  - 조건문

---

## 기본
  ### 1. 확장자 및 실행방법
  - 확장자는 통상 ".sh" 로 붙인다.
  - 실행방법
    - 에디터(vi, nano 등)으로 파일을 생성
    - `chmod +x 파일명.sh` 로 파일을 실행 가능속성으로 변경
    - `./파일명.sh` 로 실행
  - 문장 처음에 `/bin/bash` 라고 주석을 붙여 bashshell로 작성된 코드임을 표시
  - `;` 를 이용하여 연이은 실행이 가능(Bash 쉘에서의 && 와 비슷)
  - `#` 를 이용하여 주석을 넣을 수 있다.

  ```bash
  # !/bin/bash

  # 터미널에 hello world를 echo 커맨드로 출력
  echo "hello world"

  # ; 를 사용해서 연이은 실행이 가능
  echo "hello world" ; echo "hello world1"

  # exit 0 정상 종료되면0, 비정상 종료이면 0이 아닌 값
  exit 0
  ```

---

## 변수
  ### 1. 변수의 선언 및 출력
  - 변수는 `=` 를 이용하여 선언하며 스페이스가 없는 것에 주의한다.
  - 변수를 출력하는 경우 `$`와 함께 선언
  - 이 때 '' 과 "" 에 따라 출력이 달라진다.
    - `'$s'` : $s 를 그대로 출력
    - `"$s $s"` : s에 포함된 변수값 + 공백 + s에 포함된 변수값 을 출력

  ```bash

  # 변수 선언
  s="hello"

  # s 변수값을 출력
  echo $s
  echo "$s"
  echo "${s}"

  # s 변수값을 연이어 출력
  echo $s$s

  # s 변수값과 공백" " s 변수값을 출력
  echo "$s $s"

  # 와 '로 묶인 내용을 그대로 출력
  echo '$s'
  ```

  ### 2. 연산
  - \`expr 산술식\` 을 이용하여 연산 (" \` " 는 esc 아래있는 문자이다.)
  - 이 때 연산자의 앞뒤는 공백을 두어야만 한다.
  - `*`, `(`, `)` 는 앞에 역슬래시 "\\" 를 사용해야 한다.

  ```bash
  # 변수 선언
  x=10

  # x 변수값을 출력
  echo $x

  # $x+2 를 사용하려면 +2라는 문자를 출력
  # 변수를 사용해서 계산 결과를 출력하려면 expr 와 ``를 사용
  echo $x + 2
  echo `expr $x + 2`

  # 사칙 연산 중 +,-,/ 는 연산자 그대로, *는 \*로 바꿔서 사용
  echo `expr $x + 2`
  echo `expr $x - 2`
  echo `expr $x / 2`
  echo `expr $x \* 2`

  # "(" 혹은 ")" 를 사용할 때도 \를 사용
  echo `expr 2 \* \( $x + 5 \)`

  ```

  ### 3. 읽기전용 속성
  - `readonly` 를 붙여서 속성을 바꿀 수 있다.
  - 읽기 전용 속성 값은 바꿀 수 없다.

  ```bash
  # 읽기 전용 속성 추가
  readonly FILE_NAME="fast.sh"
  FILE_NAME="helloworld.sh" # 이 부분이 무시가 된다(readonly 속성이기 때문)

  ```
---

## 배열
  ### 1. 배열의 선언 및 출력
  - 배열(array)는 `(요소값 요소값 요소값 …)` 로 정의
  - 배열 값을 출력할때는 `{ , }` 로 묶어서 출력

  ```bash
  # 배열의 선언
  a=(2 4 6)

  # 배열의 출력
  echo $a       # 출력 : 2
  echo $a[1]    # 출력 : 2[1]
  echo ${a[1]}  # 출력 : 4
  ```

  ### 2. 배열의 속성
  - 배열은 0, 1, 2 순의로 0부터 시작함
  - 전체 배열의 요소를 출력하려면 `[@]` 를 사용
  - 배열이 몆개의 배열 요소를 가지고 있는 출력하려면 `#배열[@]` 를 사용
  - 배열에 추가하려면 `+=`를 이용

  ```bash
  a=(2 4 6)

  # 배열 전체요소 출력
  echo ${a[@]}    # 출력 : 2 4 6
  echo ${#a[@]}   # 출력 : 3

  # 배열의 변경
  a[2]=10
  echo ${a[@]}    # 출력 : 2 4 10

  # 배열을 추가
  a+=(20 30)
  echo ${a[@]}    # 출력 : 2 4 10 20 30
  echo ${#a[@]}   # 출력 : 5
  ```

  ### 3. 심화 (명령어 출력)
  - 배열="\`명령어\`" 로 명령어(ex. date)의 결과를 배열(d) 값으로 대입(esc키아래부분)
  - 배열의 요소 값으로 원하는 부분을 출력하거나 사용할 수 있다.

  ```bash
  # 명령어를 배열로 설정
  d=(`date`)

  echo ${d[@]}    # 출력 : 2018. 03. 04. (일) 18:49:51 KST
  echo ${d[3]}    # 출력 : (일)
  ```

---

## 조건식
  ### 1. 수치 평가 및 논리식
  - 수치의 평가
    - `-eq` : 같다. (equal)
    - `-ne` : 같지 않다. (not equal)
    - `-gt` : 크다. (grate than)
    - `-ge` : 크거나 같다. (grate and equal)
    - `-lt` : 작다. (little than)
    - `-le` : 작거나 같다. (little and equal)
  - 문자열의 평가
    - `=` : 같다.
    - `!=` : 같지 않다.
  - 파일의 평가
    - `nt` : 새로운 파일 (newer than)
    - `ot` : 기존 파일 (older than)
    - `-e` : 파일이 있는가 (exist)
    - `-d` : 경로가 있는가 (directory)
  - 논리식
    - `-a` : and
    - `-o` : or
    - `!` : not

  ### 2. test
  - 조건 식이 같다면 정상종료(0)
  - 같지 않다면 부정종료(1)
  - `$?` : 바로 직전에 결과가 정상 종료하면 0, 부정종료는 1 을 반환

  ```bash
  test 1 -eq 2; echo $?           # 출력 : 1
  test -e condition.sh; echo $?   # 출력 : 0 (이를 실행한 배시파일..)
  test 1 -eq 2 -a 2 -eq 2         # 출력 : 1
  ```

  ### 3. if, then, else, elif
  - `if` 와 `then` 을 사용하여 분기, `fi` 로 종료
    - test 문을 if 의 조건에 사용가능
    - `[  ]` 를 test 대신 사용가능하며 `[` 는 다른 명령어이므로 반드시 `[ 조건식 ]` 로 띄어쓰기를 사용해야 함에 주의
    - `if [ 조건식 ] ; then` 식으로 붙이서 표현 가능
  - if 조건이 맞지 않다면 `else` 문 이후 문장 실행
  - 조건에 또다른 조건을 붙일 경우 `elif ~ then` 를 사용
  -

  ```bash
  # 조건의 사용
  x=80
  if test $x -gt 60
  then
    echo "PASS !"
  fi
  # 출력 : PASS !

  # elif, else
  x=49
  if [ $x -gt 60 ] ; then
    echo "PASS !"
  elif [ $x -gt 50 ] ; then
    echo "soso..."
  else
    echo "Fail."
  fi
  # 출력 : Fail.

  ```

  ### 4. case
  - case 문이후 조건 `)` 에 해당하면 `;;` 전까지 문장을 실행
  - `*)` 는 위에서 기술한 이외의 조건에 대하여 실행.
  - case 문의 맨 마지막은 case의 역순 `esac` 로 종료

  ```bash
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
  # 출력 : stop!
  ```
---
