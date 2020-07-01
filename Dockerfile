FROM centos:centos7

ENV PYTHON_VERSION "3.6.1"
ENV PYENV_ROOT /$HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH


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
    && yum clean all

# look for more info: https://github.com/pyenv/pyenv-installer
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION}

RUN pip3 install --no-cache-dir \
            ansible \
            python-openstackclient