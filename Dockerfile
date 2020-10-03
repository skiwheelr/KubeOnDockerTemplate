FROM ubuntu:20.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y curl wget nano vim gnupg 
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubelet kubeadm kubectl

RUN touch freak

CMD ["/bin/bash"]


# ... save this file as Dockerfile then in same dir issue following
#
# docker build --tag stens_ubuntu .   # creates image stens_ubuntu
#
# docker run -d  stens_ubuntu  sleep infinity # launches container 
#
# docker ps     #   show running containers
#
# 
# ... find CONTAINER ID from above and put into something like this
#
# docker exec -ti $( docker ps | grep stens_ubuntu | cut -d' ' -f1 ) bash   #  login to running container
# docker exec -ti 3cea1993ed28 bash   #  login to running container using sample containerId  
#
