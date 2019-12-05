FROM registry.redhat.io/rhel7.4:latest

RUN mkdir /s3cmd
COPY . /s3cmd
RUN mv /root/s3cmd/epel.repo /etc/yum.repos.d/
RUN yum install python-pip -y
RUN pip install setuptools -y
RUN cd /root/s3cmd/; chmod +x setup.py; ./setup.py

ENTRYPOINT ["/bin/bash"]
