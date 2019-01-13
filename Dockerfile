FROM ubuntu:16.04

ENV SSHPASS password
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y default-jre && \
    apt-get install -y default-jdk && \
    apt-get install -y git &&\
    apt-get install -y sshpass

RUN mkdir /var/run/sshd 
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd -d /var/lib/jenkins --create-home jenkins && \
    mkdir /var/lib/jenkins/.ssh && \
    touch /var/lib/jenkins/.ssh/authorized_keys && \
    chown -R jenkins:jenkins /var/lib/jenkins/.ssh 

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh 

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 22	
CMD ["/usr/sbin/sshd", "-D"]