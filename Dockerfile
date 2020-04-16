# currently working with rootuser will modify to a different user once all setup is done
FROM ubuntu:18.04
RUN apt update && \
    apt install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt install -y ansible 
RUN apt-get -y install sudo openssh-server && \
    /etc/init.d/ssh start
RUN rm -r ~/.ssh && \
    ssh-keygen  -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
# ^ will update the authorized keys and if shared volume with host 
# and slaves will update the authorized keys of slave too
