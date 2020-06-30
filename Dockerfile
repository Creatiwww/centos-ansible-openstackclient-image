FROM centos:centos7

ENV PYTHON_VERSION "3.6.1"

RUN yum -y install epel-release \
    && yum -y update \
    && yum -y install \
        gcc \
        make \
        git \
        openssl-devel \
        zlib-devel \
        readline-devel \
        sqlite-devel \
        bzip2-devel \
    && yum clean all \
    && git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile \
    && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile \
    && echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile \
    && exec "$SHELL" \
    && pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION} \
    && pip3 install --no-cache-dir \
         ansible \
         python-openstackclient