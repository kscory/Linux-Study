# Linux Package
  - SW/Library 설치, 업데이트 및 업그레이드, apt-get
  - 사용자 관리, systemctl 서비스 관리
  - NTP 서버
  - 참고 - 가상머신 복제, 저장소 위치 변경

---

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

## systemctl 서비스 관리, 사용자 관리
  ### 1. systemctl 서비스 관리
  - systemctl 명령어를 통해 서비스 관리 가능
    - 현재 동작중인 서비스 목록 표시 : `systemctl –t service`
    - 서비스 설정을 표시 : `systemctl list-unit-files –t service`

  ### 2. 사용자 관리
  - 사용자 추가 및 사용자 변경가능
    - 사용자 추가 : `sudo adduser 사용자이름`
    - 사용자를 관리자 권한으로 변경 : `sudo usermod -G sudo 사용자이름`
    - 다른 사용자로 이동 : `su -사용자이름`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/adduser.png)

---

## NTP 서버
  ### 1. NTP 서버란
  - 서버가 여러대인 경우 동기화되는 시간이 (latency - 네트워크에서 딜레이되는 시간) 이 생기는 것을 막기 위해서 필요
  - 하둡 or openstack 등 여러개의 서버를 동시에 사용할 때 시간딜레이가 생기면 맞지 않을 수가 있으므로 NTP 서버를 두고 시간을 일치시킨다.
  - NTP 서버를 설정한 후 실행하면 delay 가 생기지 않는 것을 볼 수 있다.

  ### 2. NTP 서버 설치 및 설정
  - NTP 서버 설치 : `$ sudo apt-get –y install ntp`
  - 에디터를 이용해 환경 설정 변경 : `$ sudo vi /etc/ntp.conf`
  - NTP 서비스를 동작 : `systemctl restart ntp`
  - NTP 서버 동작을 확인 : `ntpq -p`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/NTP.png)

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/NTP2.png)
---

## 참고
  ### 1. 저장소 위치 변경
  - 우분투 한국 서버가 이전 작업 중이므로 서버 저장소를 바꿔 주어야 한다. (kr.archive.ubuntu.com 에 접속을 못 해서 fail이 뜨게 된다)
  - 저장소 위치를 "kr.archive.ubuntu.com" 에서  "ftp.daum.net" 로 수정한다.
  - 위치 변경 방법
    - 서버 저장소가 저장된 파일을 연다 : `$ sudo vi /etc/apt/sources.list`
    - 에디터에서 저장소 주소를 바꾼다(치환명령 이용) : `: %s/kr.archive.ubuntu.com/ftp.daum.net/g`
    - 바뀐 저장소로 업데이트 한다 : `$ sudo apt-get update`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/storage.png)

  ### 2. 가상머신 복제
  - 가상머신 복제를 하게 되면 지금까지 설정한 파일부터 다시 시작할 수 있는 장점이 있다.
  - 가상머신 복제를 하기 위해서는 "내보내기" 혹은 "복제" 를 실행
  - 네트워크를 변경 : `sudo vi /etc/network/interfaces`
    - ex> "192.168.56.11" 로 변경
  - hostname을 변경 : `sudo vi /etc/hostname`
    - ex> "ubuntu-clone" 로 변경
  - 복제한 가상머신 리부트 : `sudo reboot`

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/clone.png)

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/LinuxPackage/picture/clone2.png)
---
