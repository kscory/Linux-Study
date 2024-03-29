# Bash Shell 사용 2
  - 기본 명령어 2 (Basic Commands 2)

---

## 기본 명령어 2 (Basic Commands 2)
  ### 1. Pipe & Filter & IO redirection
  - Pipe(|) : 앞 프로그램 결과를 뒤 프로그램 입력 값으로 전달
    - 사용법 : `ls -al /usr/bin | more`
  - Filter(|) : 표준 입력으로부터 자료를 읽어 간단한 처리 후 표준 출력으로 보내는 프로그램
    - 사용법 : `ps aux | grep xfs`
  - IO redirection : 파일을 조작한다.
    - `>` : overwrite
    - `2>` : overwrite by std error
    - `>>` : append
    - `<` : Read input`

    ```
    echo "hello" > hello.txt     //  hello 라는 문자를 hello.txt에 overwrite
    echo "hello2" > hello.txt    //  hello2 라는 문자를 hello.txt에 append
    ```

  ### 2. tar
  - 파일을 압축하고 해제하는 명령어
  - 사용법 (압축) : `tar {옵션} {생성파일} {압축할 파일}`
  - 사용법 (압축해제) : `tar {옵션} {파일이름}`
    - `-z` : gzip으로 압축하거나 해제한다.
    - `-x` : 압축된 파일로부터 압축을 해제한다.
    - `-h` : 심볼릭 링크를 묶지 않는다. 심볼릭 링크가 가리키는 파일을 묶는다.
    - `-j` : bzip2 필터를 사용해서 .bz2 파일을 압축하거나 해제한다.
    - `-c` : 새 저장 파일을 만든다.
    - `-m` : 파일의 변경시간정보를 유지하지 않는다.
    - `-N, --after-date DATE, --newer DATE` : 주어진 DATE보다 새로운 파일만 저장한다.
    - `-p` : 모든 퍼미션 정보를 유지한다.
    - `-P` : 파일이름 맨 앞 / 문자를 버리지 않는다.
    - `-s` : 저장 파일 목록과 똑같은 순서로 압축을 해제한다.
    - `-v` : 처리 중인 파일을 자세하게 보여준다.
    - `-Z` : compress로 압축하거나 해제한다.
    - `-f` , --file [HOSTNAME:]F: 저장 파일 혹은 장치 파일 F에 저장한다.
    - `--version` : tar 프로그램의 버전 정보를 출력한다.
    - `--totals` : -c로 만들어진 바이트 총합을 출력한다.

  ```
  tar cvfp lab1.tar cpu.txt     // cpu.txt 파일을 lab.tar 로 압축
  tar xvfp lab1.tar             // lab.tar 파일을 압축 해제
  tar -cvzf s.tar.gz test.txt   // cpu.txt 파일을 gzip 형식으로 압축
  tar -xvzf s.tar.gz            // gzip 형식의 압축파일 해제
  ```

  ### 3. gzip & gunzip
  - gzip 형식으로 압축, `.gz` 로 표현
  - gzip + -d = gunzip
  - 사용법 : `gzip {옵션} {파일명}`
  - 사용법 : `gzip {옵션 + -d} {파일명}` or `gunzip {옵션} {파일명} `
    - `-d` : 압축 해제 옵션, gunzip과 같음
    - `-n` : n은 1부터 9사이의 숫자를 지정, 1은 가장빠른 압축, 9는 가장 느린 압축 (-9 가 best)
    - `-c` : 압축 결과를 출력하고, 원본 파일은 그대로 둔다.
    - `-f` : 강제 압축
    - `-l` : 압축 파일의 정보 출력
    - `-r` : 디렉토리를 지정 시 디렉토리에 포함된 모든 파일 압축
    - `-t` : 압축 파일 테스트

  ```
  gzip -9 lab1.tar                    // lab1.tar 파일을 gzip 형식으로 압축
  gzip -cd lab1.tar.gz | tar xvf –    // gzip 형식으로 된 파일을 압축해제
  gunzip -c lab1.tar.gz | tar xvf –   // 위와 동일
  ```

  ### 4. bzip2 & bunzip2
  - bzip2 형식으로 압축(압축률이 더 뛰어나다), `.bz2` 로 표현
  - bzip2 + -d = bunzip2
  - 사용법 : `bzip2 {옵션} {파일명}`
  - 사용법 : `bzip2 {옵션 + -d} {파일명}` or `bunzip2 {옵션} {파일명}`
    - 옵션의 gzip과 비슷

  ```
  bzip2 www.tar           // www.tar라는 파일을 압축
  bzip2 -d www.tar.bz2    // www.tar.bz2 파일의 압축을 푼다
  ```

  ### 5. backtick
  - 백틱안에 명령어를 실행한 후 출력하는 용도로 사용
  - 사용법 : `Esc` 키 아래의 \` 키를 사용한다.

  ```
  echo “The date is `date`”   // `date` 사용시 현재 시간을 출력한다.
  echo `seq 1 10`             // 1~10 까지 출력한다.
  ```

  ### 6. Hard & Soft Link
  - 하나의 파일을 1개 이상으로 사용할 때 Link를 걸어준다.
    - Hard Link : 파일을 하나 새로 만들고 이를 Link 한다.
    - Soft Link : 이름만 새로 붙여준다. (대부분 이를 사용)
  - 사용법
    - Hard Link : `ln {target file} {link name}`
    - Soft Link : `ln -s {target file} {link name}`

  ```
  ln –s myapp-1/test myapp-link   // myapp-1 디렉토리의 test 파일을 myapp-link 란 이름으로 soft link를 걸었다.
  ```

  ### 7. find
  - 파일 혹은 파일 내 검색을 할 수 있는 명령어
  - 참고 : [리눅스 find 명령어에 대해 알아보자.](http://corej21.tistory.com/45?category=625038)
  - 사용법 : `find {경로} {옵션} [expression]`
  - 옵션
    - `-name {문자열}` : 파일이름이 문자열과 일치하는 파일을 찾는다. (아래는 문자열)
      - hello : 파일이름이 hello인 파일
      - \*hello: 마지막 문자열이 hello로 끝나는 모든 파일
      - hello\*: hello로 시작하는 파일
      - \*hello\*: hello라는 문자가 어디든 상관없이 포함하는 파일
      - ?hello: 첫 글자는 어떤 문자라도 상관없고 뒤에 문자열이 hello인 파일
      - ??hello: 앞에 두 글자는 어떤 문자라도 상관없고 뒤에 문자열이 hello인 파일
    - `-user {사용자}` : 특정 사용자 소유권인 파일을 찾을 때 사용한다.
    - `-perm {퍼미션}` : 명시된 퍼미션으로 된 파일을 찾을 때 사용한다.
    - `-exec` : 찾아진 파일 등과 연계해서 명령을 내리게 하는 옵션으로 사용하기 위해서는 마지막에 \;를 입력해야 한다.
    - `-type {파일종류}` : 디렉터리(d), 파이프(p), 심볼릭 링크(l), 소켓(s), 블록 파일(b), 문자 파일(c), 일반 파일(f) 등을 사용한다.
    - `-links {숫자}` : 특정 개수의 링크를 가진 파일을 찾는다.
    - `-size {파일 크기 n}` : 파일 크기(블록단위)가 일치하는 것을 검색한다. +n은 n 블록보다 큰 파일, -n은 n 블록보다 작은 파일, nc는 n 문자 길이의 파일을 찾는다.
    - `-atime {일 n}` : n일 이전에 접근한 파일을 찾는다.
    - `-ctime {일 n}` : n일 이전에 변경된 파일을 찾는다.
    - `-mtime {일 n}` : n일 이전에 수정된 파일을 찾는다.
    - `-mmin {분 n}` : n분 전에 마지막으로 수정된 파일을 찾는다.
    - `-newer {파일}` : 지정한 파일보다 최근에 갱신된 파일을 검색한다.

  ```
  find ./ -name *log*                           // 현재 디렉터리를 기준으로 log가 포함된 모든 파일 찾기
  find /home/corej/Desktop -perm 755            // /home/corej/Desktop 디렉터리 아래 퍼미션이 755인 파일을 찾기
  find ./ -mtime +30 -print -exec rm -rf {} \;  // 30일이 지난 파일을 삭제하기
  find ./ -name "*.sql" | xargs grep corej      // 현재 디렉터리를 기준으로 sql 파일 중 corej를 포함한 파일을 찾기
  ```

  ### 8. whereis & which & locate
  - 명령어 및 파일의 경로를 확인한다.
    - whereis : 명령어의 실행파일위치, 소스위치, man 페이지파일의 위치를 찾아주는 명령어
    - which :  특정명령어의 위치를 찾아주는 명령어
    - locate : 다양한 패턴의 파일들을 찾고자 할 때 매우 유용하게 사용되는 명령어
  - 사용법
    - whereis : `whereis {옵션} {명령어}`
    - which : `which {옵션} {명령어}`
    - locate : `locate {옵션} {명령어}`

  ```
  whereis find          // find 에 해당하는 명령어 관련해서 찾는다.
  which find            // find 에 해당하는 명령어 관련해서 찾는다.
  which -a find         // find 에 해당하는 명령어를 검색 가능한 모든 경로에서 찾는다.
  locate *.bak          // 현재 시스템에 존재하는 *.bak 에 해당하는 파일 찾기
  locate -n 10 *.conf   // 특정패턴에 해당하는 파일들 가운데 지정한 개수만큼 검색
  ```

  ### 9. ! (재실행)
  - history 순서에 따른 명령어를 다시 실행한다.
  - 사용법 : `! {숫자 or 문자}`

  ```
  !103        // history에서 103 번째 명령어를 다시 실행한다.
  !!          // history에서 바로 전의 명령어를 다시 실행한다.
  !pw         // pw만을 입력해도 앞에서 pwd 명령어를 실행했다면 이를 실행한다.
  !pw:p       // 실행했던 명령어 중에 pw가 들어갔던 명령어를 출력한다.

  ls myapp-1  // myapp-1 이라는 결과를 사용
  cd !$       // !$ 는 myapp-1 이라는 결과가 들어가므로 디렉토리를 myapp-1로 이동한다.
  ```

  ### 10. man
  - 도움말을 보여준다. (q 버튼으로 종료)
  - 사용법 : `man {명령어}`

  ```
  man ls    // ls에 대한 도움말을 보여준다.
  ```

  ### 11. df & du
  - 디스크 사용량을 확인하는 명령어
    - df : 리눅스 시스템 전체의 (마운트 된) 디스크 사용량을 확인
    - du : 특정 디렉토리를 기준으로 디스크 사용량을 확인
  - 사용법
    - df : `df {옵션}`
    - du : `du {옵션} {Path}`

  ```
  du            // 전체 디스크 사용량을 확인
  du -h         // 전체 디스크 사용량을 G,M 등의 단위로 보여줌
  du -h /home   // /home 디렉토리의 디스크 사용량을 G,M 등의 단위로 보여줌
  du -sh /home  // 위와 동일하지만 요약된 정보를 보여줌
  ```

  ### 12. lsattr
  - 파일 및 디렉토리 속성을 출력한다.
  - 사용법 : `lsattr {-Radv} {대상파일들}`
    - `-R` : 디렉토리와 그 이하 모든 내용에 대해 재귀적으로 속성값 출력.
    - `-a` : '.'로 시작하는 파일을 포함한 디렉토리 내의 모든 파일 출력.
    - `-d` : 디렉토리를 보여줄 때 안에든 파일을 보여주는 것이 아닌, 폴더를 일반 파일처럼 출력.
    - `-v` : 파일의 버전 출력

  ```
  lsattr /etc/host*         // etc 디렉토리안에 host로 시작하는 파일들의 속성 출력
  lsattr -aR /tmp/ | less   // 모든 /tmp 속성을 재귀적으로 나열
  ```

  ### 13. chattr
  - 파일 및 디렉토리 속성을 설정하고 제어한다.
  - 사용법 : `chattr {-RV} {-v 설정버전} {+-=설정모드} {대상파일들}`
  - 옵션
    - `-R` : 현재 디렉토리 이하 모든 디렉토리와 파일의 속성을 변환한다.
    - `-V` : 자세한 출력모드 제공
    - `-v` : version. 지정된 파일의 버전 정보를 설정할 수 있다.
  - 설정모드
    - `+` : 지정한 속성을 추가한다.
    - `-` : 지정한 속성을 제거한다.
    - `=` : 원래 파일이 가지고 있던 그 속성만을 유지한다.
  - 설정모드 속성
    - `a 속성` : 해당 파일을 추가만 할 수 있다. root만이 속성 변경이 가능하며, 파일보안을 위해 주로 사용하는 속성이다.
    - `c 속성` : 이 속성이 설정된 파일은 커널에 의해 디스크 상에 자동적으로 압축된 상태로 저장한다. 파일을 읽을 경우에는 압축을 해제한 상태로 되돌려주고, 스기시에는 디스크에 저장하기 전에 파일을 압축한다.
    - `d 속성` : dump 명령 수행시 백업이 되지 않도록 설정된다. (dump명령에 의하여 백업되지 않도록 보호. 이러한 특징을 적용해 크기가 큰 ISO 이미지 파일 등을 백업에서 제외시킬 수 있다.)
    - `i 속성` : 제일 자주 사용하는 속성. 이 속성이 설정되면 해당 파일의 변경, 삭제, 이름변경, 파일 추가 및 링크파일 생성이 허락되지 않는다. 오직 root만이 이 속성을 해제할 수 있다. 변경 추가가 거의 없는 부팅관련 파일들에 설정하면, 부팅이 되지 않는 문제로 인한 시스템 장애를 줄일 수 있다.
    - `s 속성` : 이 속성이 설정된 파일은 파일삭제가 될 경우에 해당블럭이 모두 0으로 되어 버리고 디스크에 다시 쓰기가 발생한다. 이 속성이 설정된 파일은 변경이 될 경우에 디스크동기화가 일어나는 효과를 그대로 누릴 수 있다.
    - `u 속성` : 이 속성을 가진 파일이 삭제되면, 그 내용이 저장이 되서 삭제되기 전의 데이터로 복구가 가능해진다.

  ```
  chattr +i /etc/sudoers    // ----i----------- 속성을 추가
  ```

---

## Process & System Information & C Programming 관련 명령어
  ### 1. Process 관련 명령어
  - Monitoring
    - `ps` : list of your process
    - `ps aux` : all running process, with command Lines
    - `top` : top processes
    - `ksysgaurd` : Graphical monitor, more than process monitor
    - `pstree` : tree of running processes
    - `/proc/process-id` : kernel information about processes
  - Process & Signal
    - `skill -<signal number> <process id>` : user send signal
    - `skill -L` : List of signals
    - `man 7 signal` : Full description of signals
    - `kill <procees-id>, kill -9 <process-id>` : Kill the process
    - `killall -9 <process name>` : kill the process

  ### 2. System Information 관련 명령어
  - System Information 관련 명령어
    - `uname -a, -r` : Kernel name
    - `dmesg` : Kernel messages
    - `/var/log/` : system logs (syslogd) and application's messages
    - `date` : date of system
    - `uptime` : How long time your system is alive?
    - `iostat <device name>`: usage of cpu and device
    - `users, who, w` : list of on-line users
    - `finger <user-name>/@<computer name>` : remote users info

  ### 3.C Programming 관련 명령어
  - All steps altogether
    - `gcc -o <output name> <input C>`
  - Intermediate results
    - `-c` : Just compile, with out linking
    - `-S` : Produce assembly code
    - `-E` : Just process the file
    - `-g` : Add debugging options
