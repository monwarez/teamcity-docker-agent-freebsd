# Pull base image.
FROM fedora
MAINTAINER Alexis Jeandet "alexis.jeandet@member.fsf.org"

# Install.
RUN dnf install -y http://download.virtualbox.org/virtualbox/5.1.28/VirtualBox-5.1-5.1.28_117968_fedora25-1.x86_64.rpm unzip xonsh vagrant

# Add files.
RUN mkdir -p /vm/buildAgent
ADD start_vm.xsh /vm/
ADD start.sh /vm/
ADD tc.sh /vm/
ADD bootstrap.sh /vm/
ADD Vagrantfile /vm/
ADD FreeBSD.conf /vm/
ADD FreeBSD-latest.conf /vm/

ADD https://teamcity.jetbrains.com/update/buildAgent.zip /vm/
RUN unzip /vm/buildAgent.zip -d /vm/buildAgent/ && \
     chmod +x /vm/start_vm.xsh && \
     chmod +x /vm/start.sh && \
     chmod +x /vm/tc.sh && \
     touch /vm/env && \
     echo "" >> /vm/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.bsd=true" >> /vm/buildAgent/conf/buildAgent.dist.properties && \
     echo "system.os=FREEBSD" >> /vm/buildAgent/conf/buildAgent.dist.properties


# Define working directory.
WORKDIR /vm

# Ports open.
EXPOSE 22 5800 5900 5901

# Define default command.
CMD ./start_vm.xsh
