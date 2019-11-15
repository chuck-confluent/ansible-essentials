FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
        ssh \
        vim \
        software-properties-common \
    && add-apt-repository ppa:ansible/ansible \
    && apt-get update \
    && apt-get install -y ansible

RUN sed -i \
        's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
        /etc/ssh/sshd_config

CMD ["bash", "-c", "service ssh start & tail -F /dev/null"]