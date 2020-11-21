FROM ubuntu:latest
LABEL maintainer="Mirko Dziadzka <mirko.dziadzka@gmail.com>"
LABEL description="A simple ssh jumphost"

RUN apt-get update
RUN apt-get install -y supervisor
RUN apt-get install -y openssh-server
RUN apt-get install -y sudo

COPY packages.txt /packages.txt
RUN xargs -a packages.txt apt-get install -y

RUN mkdir -p /run/sshd

RUN mkdir /local
RUN useradd --base-dir /local --create-home --shell /bin/bash user
RUN mkdir --mode 0700 ~user/.ssh
RUN chown -R user ~user

# COPY authorized_keys /local/user/.ssh/authorized_keys
COPY supervisord.conf supervisord.conf
COPY sudoers /etc/sudoers
COPY init.sh /init.sh
RUN chmod 0755 /init.sh

ENV SSH_AUTHORIZED_KEYS=""
VOLUME /mnt
EXPOSE 22/tcp

ENTRYPOINT ["/init.sh"]


