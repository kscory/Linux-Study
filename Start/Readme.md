# Linux 기본 및 세팅
  - Linux 구성
  - Virtual box 및 Ubuntu 설치
  - SSH console(putty) 설치
  - 참고 : centOS 설치

---

## Linux 구성
  ### 1. 리눅스 커널
  - 1991.8.26 에 처음 발표 그 후 계속 늘어가고 있다.
  - Linux 커널 구조

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/linuxkernal.png)

  - Linux Kernal Source Tree Layout

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/linuxkernal2.png)

---

## Virtual box 및 Ubuntu
  ### 1. Virtualbox & Ubuntu 다운로드
  - https://www.ubuntu.com/ 에 접속하여 ubuntu Server를 다운받는다.
  - https://www.virtualbox.org 에 접속하여 다운 받고 설치한다. 여기서 중요한 것은 아래 표시된 파일 두개 모두 다운로드 해야 한다. (저작권 관련 문제 때문에 platform을 따로 관리하고 있다.)

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/virtualbox.png)

  ### 2. Virtualbox Setting 및 참고 사항
  - [VirtualBox Setting](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/pdf/VirtualBoxSetting.pdf) 에서 Setting 과정을 확인할 수 있다.
  - VirtualBox Network에는 NAT와 HostOnly Adapter 가 존재한다.
    - NAT의 경우 기본 네트워크로 가상머신을 거치지 않고 직접 기본 OS 와 통신을 하는 네트워크
    - HostOnly 의 경우 가상머신과 기본 OS를 연결시켜 준다.

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/virtualbox2.png)

  ### 3. Ubuntu Setting 및 참고사항
  - [Ubuntu Setting](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/pdf/UbuntuSetting.pdf) 에서 Setting 과정을 확인할 수 있다.
  - 아래와 같이 CLI를 이용하여 날씨를 알아보도록 해보자

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/ubuntu.png)

---

## SSH console(Putty)
  ### 1. SSH console(Putty) - 윈도우 다운로드 및 접속
  - 윈도우의 경우 https://www.putty.org/ 에 접속하여 알맞은 알맞은 버전을 다운받아 설치한다.

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/putty.png)

  - Putty를 실행한 후 아래와 같이 Session에서 Host Name을 192.168.56.10 로 설정한 후 실행하고 경고문이 나온다면 잘 접속된 것이다.
    - "192.168.56.10" 은 Ubuntu Server IP 로 Host Only 로 설정한 IP
    - Port 가 22인지 확인하고, SSH 설정되어 있는지 확인
    - Putty를 실행하기 전 반드시 가상머신을 통해 Ubuntu를 실행시킨 후 진행한다.
  - Putty 연결이 되었다면 ID Password를 입력하여 아래와 "ubuntu@ubuntu:~$" 와 같이 나왔다면 SSH 접속이 성공한 것이다.

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/putty2.png)

  ### 2. SSH console(Putty) - OSX 의 경우
  - OSX 환경의 경우 터미널을 연다.
  - "$ ssh 192.168.56.10 –l ubuntu" 로 접속한다.

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/picture/putty3.png)

---

## 참고사항
  ### 1. CentOS Setting
  - [CentOS Setting](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Start/pdf/CentOSSetting.pdf) 에서 Setting 과정 확인 가능 (상세히 X)
