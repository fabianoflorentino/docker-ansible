FROM alpine

RUN apk add sshpass openssh ansible python py-pip make vim \
  && adduser --disabled-password --gecos "" ansible

USER ansible

RUN ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -C ansible@dev

WORKDIR /home/ansible

ENTRYPOINT [ "sh" ]