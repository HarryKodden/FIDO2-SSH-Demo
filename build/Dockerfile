FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && apt-get -y install software-properties-common build-essential zlib1g-dev libssl-dev libcbor-dev wget

RUN apt-add-repository -y ppa:yubico/stable && apt-get update && apt-get -y install libfido2-dev

RUN apt-get -y install ssh && apt-get -y remove ssh

RUN wget http://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.2p1.tar.gz
RUN tar xvzf openssh-8.2p1.tar.gz
RUN cd openssh-8.2p1 && ./configure --with-security-key-builtin --with-md5-passwords && make && make install 

EXPOSE 22

CMD ["/usr/local/sbin/sshd", "-D"]
