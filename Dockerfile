FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y gcc python-dev libkrb5-dev && \
    apt install software-properties-common && \
    apt update && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install python3.9 && \
    python3.9 --version && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.9 get-pip.py && \
    # apt-get install python3.9-pip -y && \
    pip3.9 install --upgrade pip && \
    pip3.9 install --upgrade virtualenv && \
    pip3.9 install pywinrm[kerberos] && \
    apt install krb5-user -y && \ 
    pip3.9 install pywinrm && \
    pip3.9 install ansible