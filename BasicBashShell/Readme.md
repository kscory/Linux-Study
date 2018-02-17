# Bash Shell 사용
  - Bash Shell 기본
  - 기본 명령어 (Basic Commands)
  - File 다루기
  - 참고 : CLI 사용 이유

---

## Bash Shell 기본
  ### 1. 기본 명령어의 구조
  - "command name" "Options(flags)" /"Arguments"
  - ex> **ls -1 /etc**

  ### 2. Shell의 기본
  - Shell이란 사용자가 실행을 입력하고 관리하는 명령을 해석한다.
  - Shell의 종류에는 tcsh, csh, korn 및 "bash" 가 존재하며 최근에는 거의 Bash shell 로 통합되고 있다. (각 쉘마다 미묘한 차이 존재)
  - 로그인에 성공하면 쉘 프롬프트가 표시된다.

  ### 3. Shell의 특징
  - Shell 명령어는 대소문자를 구분 한다. (Linux는 대소문자를 구분)
  - Linux 는 여러개의 명령을 동시에 실행할 수 있다.
  - 사용자 공간(User Space)는 두 가지 권한이 존재 한다.
    - $ : 사용자
    - \# : root (관리자)
  - reset : 화면을 다시 초기화 한다.
  - Autocomplete(자동완성)
    - 명령 및 파일 이름을 자동으로 완성시킨다.
    - $ PATH의 명령지정된 경로의 파일 이름
  - Linux는 두가지 foreground와 background가 존재하며 실행시킨 프로세스는 background에서 실행된다.

  ### 4. 몇가지 단축키
  - CTRL-R : 지난 명령어 이력을 검색
    - $ history 명령으로도 지난 명령어 이력을 출력할 수 있음.
    - 또한 arrow keys 를 사용해 지난 이력을 보거나 실행할 수 있음.
  - CTRL-L: Clear 명령어(스크린의 명령줄을 지워준다.)
    - $ clear 명령어와 동일
  - CTRL-D: 로그아웃, 파일을 종료
  - CTRL-C: Stop
  - CTRL-Z: Suspend
  - CTRL-E: cut to end of line
  - CTRL-U: cut to start of line

---


## 기본 명령어 (Basic Commands)
  ### 1. pwd
  - 지금 어느 위치에 있는지 알려준다.

  ```
  pwd
  ```

  ### 2. cd
  - 디렉토리를 이동한다.

  ```
  cd    // /home 디렉토리로 이동
  cd ~  // /home 디렉토리로 이동
  ```

  ### 3. ls
  - 디렉토리와 파일의 정보를 출력

  ```
  ls                      // 디렉토리 파일 정보를 간략하게 보여준다. (일부는 보여주지 않는다.)
  ls -l                   // 디렉토리 파일정보를 자세히 보여준다. (일부는 보여주지 않는다.)
  ls -a                   // 모든 디렉토리 파일 정보를 간략하게 보여준다.
  ls -al                  // 모든 디렉토리 파일 정보를 자세히 보여준다.
  ls -l --sort=time       // 디렉토리 파일 정보를 시간 순서로 자세히 보여준다.
  ls -al --sort=size -r   // 모든 디렉토리 파일 정보를 파일 크기 순서로 자세히 보여준다.
  ```

---


## File 다루기
  ### 1. ㅇ
  -

---

## 참고사항
  ### 1. CLI를 사용하는 이유
  - app1, app2, … app99 의 폴더를 만들어야 할 경우 GUI 환경에서는 99 번의 폴더 생성 작업을 실행해야 하지만 CLI의 경우 아래의 명령어만으로 99개의 폴더 생성이 가능하다.

  ```
  $ mkdir test        // 폴더를 생성
  $ cd test           // 디렉토리 변경
  $ mkdir app{1..99}  // 폴더를 99개 생성
  ```
---
