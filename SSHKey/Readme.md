# SSH Key
  - SSH 란
  - 리눅스에서 생성 및 사용법 (Only Linux)
  - 윈도우에서 설정
  - (계속 추가)

---

## SSH Key 란
  ### 1. PKI (Public key infrastructure)
  - PKI 란 public Key, private key 로 이루어진다.
    - public key : 공개키로 다른사람에게 공개하는 키이다.
    - private key : 개인키로 자신이 보관하며 패스워드와 같은 키이다.
  - private key 로 암호화 된 것은 그 public key 로만 풀 수 있으며 반대로 public key로 암호화 된 것은 그 private key 로만 풀 수 있는 유일키다.
  - 이를 이용해 서로 다른 네트워크 사이에서 통신을 하게 된다.
  - 또한 개인키로 암호화 하는 것을 "전자서명" 이라고 부른다.

  ### 2. PKI 종류
  - RSA : Key management + authentication
  - DSA : Only authentication, no key management
  - Diffie-Hellman : Only key management, no authentication.
  - ECC : RSA와 ElGamal과 같은 공개키 암호 방식들의 아날로그형 (타원곡선암호방식)

  ### 3. SSH 저장소
  - OpenSSH_Server 설정 파일 저장위치 : `/etc/ssh/.`
    - sshd_config – SSH server configuration
    - ssh_config – SSH client configuration
  - 사용자 ssh key 저장 위치 : `~/.ssh/`
    - `id_rsa` : 자신의 개인키에대한 정보가 저장
    - `id_rsa.pub` : 자신의 공개키에 대한 정보가 저장
    - `known_hosts` : 접속했었던 호스트키 리스트를 저장
    - `authorized_keys` : 다른 서버의 공개키 리스트가 저장

  ### 4. 사용되는 방식
  - 네트워크 혹은 공인인증서에 주로 사용된다.

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/SSHKey/picture/ssh.png)

---

## 리눅스에서 생성 및 사용법 (ubuntu, osx 등 unix 계열 환경)
  ### 1. SSH Key 생성 및 설정
  - ssh-keygen을 이용해서 ssh key 를 생성 : `ssh-keygen -t rsa`
  - 공공키를 인증을 위한 키셋 생성

  ```bash
  cd ~/.ssh                         # ~/.ssh 폴더로 이동
  cp id_rsa.pub authorized_keys     # 공공 키를 복사하여 공개키 리스트를 생성(복사)
  chmod 600 ~/.ssh/authorized_keys  # 인증키 접근 권한을 사용자만으로 변경
  ```

  ### 2. 네트워크 연결
  - ssh key 복사
  - ssh key를 이용해서 서버에 접속
    - 다른 서버에 접속
    - 자신의 서버에 접속
  - 나올때는 `exit` 를 이용
  - 만약 접속한 계정이 나오면 접속이 성공한 것
  - 참고
    - ip 에 대한 정보 확인 : `ifconfig –a`
    - 특정한 호스트가 도달할 수 있는지의 여부를 테스트 : `ping 192.168.56.10` </br> (192.168.56.10에 호스트가 도달할 수 있는지 확인할 수 있다. (CTRL+C) 로 빠져나옴)

  ```bash
  ssh-copy-id ubuntu@192.168.56.11  # 192.168.56.11 에 있는 ubuntu 사용자에 public key 를 복사
  ssh 192.168.56.11                 # 192.168.56.11 로 네트워크 연결
  ssh -i ~/.ssh/id_rsa              # 자신의 서버로 접속 (ssh –i 명령은 개인키를 지정하는 명령어)
  ```

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/SSHKey/picture/ssh2.png)

---

## 윈도우(Putty)로 사용법
  ### 1. SSH Key 설치 및 설정
  - ㅇㅇ

  ```

  ```
---
