# Python
  - Python
    - python 설치
    - pyenv 설치 및 실행
    - python 실행 예시
    - PyMySQL 설치
  - [Python 설명 및 명령어](https://github.com/Lee-KyungSeok/Python-Study)

---

## 기본적인 설치
  ### 1 기본적인 설치
  - 기본적인 설치방법
  - 그냥 설치 시 2점대가 설치되므로 주의
  - 또한 단 하나의 환경만 사용 가능하게 되므로 pyenv를 이용하는 것을 권장

  ```
  $ sudo apt-get install -y python-dev
  ```

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Python/picture/install.png)

---

## pyenv를 이용한 Python 설치

  ### 1. pyenv 란
  - [pyenv](https://github.com/pyenv/pyenv) 란 python 버전관리 프로그램이다
  - 프로젝트 별로 각각 맞는 다양한 python 버전으로 실행해 볼 수 있도록 환경 제공
  - 복수의 파이썬 버전을 선택적으로 설치할 수 있게 한다.

  ### 2. pyenv를 이용하기 위한 세팅
  - 여러 가지를 따로 설치해준다.
  - pyenv 구성을 위해서 모두 설치한다.
  - `gcc` 와 `make` 는 `build-essential` 로 바꿔서 설치할 수 있다. (build-essential 안에 gcc 와 make 가 존재)

  ```
  $ sudo apt-get install -y \
  git \
  gcc \
  make \
  openssl \
  libssl-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev
  ```

  ### 3. pyenv 설치
  - github에서 가져옴(git clone)

  ```
  $ git clone https://github.com/yyuu/pyenv.git ~/.pyenv
  ```

  - Path 설정 (각자 환경에 맞게 .bash_profile 대신 .bashrc 혹은 .zshrc 로 적용)

  ```
  $ echo 'export PYENV_ROOT="$HOME/.pyenv" ' >> ~/.bashrc
  $ echo 'export PATH="$PYENV_ROOT/bin:$PATH" ' >> ~/.bashrc
  $ echo 'eval "$(pyenv init -)" ' >> ~/.bashrc
  $ source ~/.bashrc
  $ exec $SHELL -l
  ```

  ### 4. Python 설치
  - 설치 가능한 목록 확인 : `$ pyenv install --list`
  - 특정 버전의 파이썬 설치 : `$ pyenv install 버전명`
  - 다운 받은 파이썬 버전 확인 : `$ pyenv -versions`

  ```bash
  # 설치 가능한 목록 확인
  $ pyenv install --list

  # 2.7.14 버전 설치 (2점대버전)
  $ pyenv install 2.7.14

  # 3.6.4 버전 설치 (3점대 버전)
  $ pyenv install 3.6.4

  # 다운 받은 파이썬 버전 확인
  $ pyenv -versions
  ```

---

## 3. pyenv-virtualenv
  ### 1. pyenv-virtualenv 란
  - python 프로젝트마다 각각의 가상환경을 만들어 주는 라이브러리
  - 즉, django, tensorflow 등 각각 다르게 지정하여 관리가 가능하게 된다.

  ### 2. pyenv-virtualenv 설치
  - pyenv의 플러그인 폴더로 설치했다.

  ```
  $ git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
  $ echo 'eval "$(pyenv virtualenv-init -)" ' >> ~/.bashrc
  $ exec $SHELL -l
  ```

  ### 3. 가상환경 세팅 방법
  - 가상환경 만들기 : `$ pyenv virtualenv [버전명] [가상환경이름]`
  - 시작하기 : `$ pyenv activate [가상환경 이름]`
  - 끝내기 : `$ pyenv deactivate`
  - 가상환경 목록보기 : `$ pyenv virtualenvs`
  - 가상환경 삭제하기 : `$ pyenv uninstall [가상환경이름]`
  - 자동 설정(고정하기) : 디렉토리 이동 후 `pyenv local [가상환경이름]`

  ```bash
  # 가상환경 만들기 (venv3.6.4 라는 이름의 가상환경 이름 설정)
  $ pyenv virtualenv 3.6.4 venv3.6.4

  # 디렉토리에 가상환경 고정하기(on/off 가 자동으로 된다.)
  $ mkdir -p ~/python-ex    # python-ex 디렉토리 생성
  $ cd ~/python-ex          # 디렉토리로 이동
  $ pyenv local venv3.6.4   # 가상환경 고정
  ```

  ![](https://github.com/Lee-KyungSeok/Linux-Study/blob/master/Python/picture/install2.png)

---

## 4. Python 실행하기
  ### ㅇㅇ
  - ㅇㅇ

---

## 5. PyMySQL 설치
  ### ㅇㅇ
  - ㅇㅇ
