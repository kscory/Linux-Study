# MySQL
  - MySQL
    - mysql 설치 및 실행
    - 외부 파일로 명령어 실행 방법
  - [MySQL 설명 및 명령어](https://github.com/Lee-KyungSeok/MySQL-Study)

---

## Database
  ### 1. MySQL 설치
  - 설치할 mysql-server 패키지를 확인 : `# apt-cache search mysql-server`
  - 패키지에 맞는 mysql-server 설치 (5.7 설치함) : `# apt-get install mysql-server-5.7`
  - cf> Maria DB 설치 : `# apt-get install mariadb-server`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Database/picture/install.png)

  ### 2. MySQL 실행
  - `mysql -u root -p` : root 계정으로 접속
  - `mysql -u 사용자ID -p패스워드 데이터베이스이름`

  ```bash
  # root 계정 사용 (비밀번호는 그 뒤 입력)
  $ mysql -u root -p

  # myapp_user 계정 사용 (비밀번호는 그 뒤 입력)
  $ mysql -u myapp_user -p

  # myapp_user 계정과 my_pass 라는 패스워드를 사용하여 MySQL 접속
  $ mysql -u myapp_user -pmy_pass

  # myapp 이라는 데이터베이스를 사용
  $ mysql -u myapp_user –pmy_pass myapp
  ```

  ### 3. 몇가지 명령어
  - 반드시 `;` 를 마지막에 사용
  - 도움말 : `help;`
  - 중간에 명령어를 중지 : `\c`
  -  MySQL 종료 : `quit` 혹은 `\q`
  - 선택된 사용자 확인 : `mysql> select user();`
  - mysql 이 사용하는 데이터베이스 확인 : `mysql> show databases;`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Database/picture/command.png)  

  ### 4. 외부 파일로 명령어 실행 방법
  - vi 에디터로 파일 생성 후 SQL문 작성 ( ex> `vi myapp.sql` )
  - 두 가지의 실행 방법 존재
    - 리다이렉션 이용 방법  : `$ mysql –u root -pmysql < myapp.sql`
    - Mysql에 접속해서 실행 : `mysql> \. ./myapp.sql`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Database/picture/out.png)  
