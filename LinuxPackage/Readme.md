# Linux Package
  - SW/Library 설치, 업데이트 및 업그레이드, apt-get
  - 사용자 관리, systemctl 서비스 관리
  - NTP 서버
  - 참고 - 가상머신 복제

---aptget.pn

## SW/Library 설치
  ### 1. 직접 설치
  - 소스코드를 직접받아가지고 쓰는 방식이다
  - 하지만 매번 직접 받기는 어려워 새로운 방식이 생김
  - 아래와 같은 방법으로 설치한다.

  ```
  $ curl -fL http://openssl.skazkaforyou.com/source/openssl-1.1.0g.tar.gz
  $ tar xvf openssl-1.1.0g.tar.gz
  $ cd openssl-1.1.0g
  $ ./configure
  $ make
  $ make install
  ```

  ### 2. 커멘드 기반으로 설치
  - `apt-get`을 통해 설치하며 대표적으로 업데이트와 업그레이드가 있다.
  - 업데이트 : 저장소는 원격에 있고 이 패키지의 정보를 최신 것으로 갱신한다.
    - 사용법 : `sudo apt-get update`
  - 업그레이드 : 커널이나 주요 라이브러리와 같은 핵심 부분을 새버전으로 갱신
    - 사용법 : `sudo apt-get upgrade`
    - 그러나 kernal에 dependency가 있어 항상 최신 버전을 다운받지는 않아 의존성 검사를 하며 설치하는 `apt-get dist-upgrade` 가 일반적이다.
  - 그 외에도 여러가지 존재
    - 패키지 설치 : `sudo apt-get install 패키지이름`
    - 패키지 재설치 : `apt-get --reinstall install 패키지이름`
    - 패키지 삭제(설정파일은 지우지 않음) : `sudo apt-get remove 패키지이름`
    - 설정파일까지 모두 지움 : `sudo apt-get --purge remove 패키지이름`
    - 패키지 소스코드 다운로드 : `sudo apt-get source 패키지이름`
    - 위에서 받은 소스코드를 의존성있게 빌드 : `sudo apt-get build-dep 패키지이름`
    - 패키지 검색 : `sudo apt-cache search 패키지이름`
    - 패키지 정보 보기 : `sudo apt-cache show 패키지이름`
    - 과거의 파일 중 필요없다고 생각되는 것들을 자동으로 삭제 : `sudo apt-get autoclean`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/aptget.png)

---

## 사용자 관리, systemctl 서비스 관리
  ### 1. 사용자 관리
  - ㅇㅇ

  ```Bash

  ```

  ### 2. systemctl 서비스 관리
  - ㅇㅇ

  ```Bash

  ```
---

## NTP 서버
  ### 1. 사용자 관리
  - ㅇㅇ

  ```Bash

  ```

  ### 2. systemctl 서비스 관리
  - ㅇㅇ

  ```Bash

  ```
---

## 참고
  ### 1. 가상머신 복제
  - ㅇㅇ

  ```Bash

  ```
---
