FROM maven:3.6.0-jdk-13
RUN useradd -m -u 1000 -s /bin/bash jenkins
RUN yum install -y openssh-clients
USER root
RUN mkdir -p /home/jenkins/.m2 && chown -R jenkins /home/jenkins
USER jenkins 