FROM maven:3.6-jdk-8
RUN useradd -m -u 1000 -s /bin/bash jenkins
RUN apt-get update && apt-get install -y openssh-client sudo && apt-get clean
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
