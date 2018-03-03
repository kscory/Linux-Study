# SSH Key
  - SSH 란
  - 리눅스에서 설치 및 사용법 (Only Linux)
  - 윈도우에서 설치
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

## 리눅스에서 설치 및 사용법 (Only Linux)
  ### 1. SSH Key 설치 및 설정
  - ㅇㅇ

  ```

  ```

  ### 2. 네트워크 연결
  - ㅇㅇ

  ```

  ```

---

## 윈도우(Putty)로 사용법
  ### 1. SSH Key 설치 및 설정
  - ㅇㅇ

  ```

  ```
---
