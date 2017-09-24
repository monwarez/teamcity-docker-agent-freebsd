# Pull base image.
FROM fedora
MAINTAINER Alexis Jeandet "alexis.jeandet@member.fsf.org"

# Install.
RUN dnf install -y qemu-kvm genisoimage unzip xonsh

# Add files.
RUN mkdir -p /freebsd/iso/buildAgent
ADD start_freebsd.xsh /freebsd/
ADD start.sh /freebsd/iso/
ADD tc.sh /freebsd/iso/

ADD https://teamcity.jetbrains.com/update/buildAgent.zip /freebsd/
RUN unzip /freebsd/buildAgent.zip -d /freebsd/iso/buildAgent/ && \
     chmod +x /freebsd/start_freebsd.xsh && \
     chmod +x /freebsd/iso/start.sh && \
     chmod +x /freebsd/iso/tc.sh && \
     echo "" >> /freebsd/iso/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.bsd=true" >> /freebsd/iso/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.os=FREEBSD" >> /freebsd/iso/buildAgent/conf/buildAgent.dist.properties
                             

# Define working directory.
WORKDIR /freebsd

# Ports open.
EXPOSE 22 5800 5900 5901

# Define default command.
CMD ./start_freebsd.xsh
