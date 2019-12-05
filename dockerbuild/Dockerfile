FROM registry.redhat.io/rhel7:latest

RUN rm /etc/yum.repos.d/*
COPY centos-base.repo /etc/yum.repos.d/
COPY pgdg-redhat-all.repo /etc/yum.repos.d/
RUN mkdir /s3cmd
COPY temp/s3cmd.tar.gz /s3cmd/
RUN cd /s3cmd && tar -zxvf s3cmd.tar.gz
RUN yum install python-pip -y
RUN pip install --upgrade pip
RUN pip install setuptools 
RUN cd /s3cmd/s3cmd-2.0.2; chmod +x setup.py; ./setup.py install

RUN yum install postgresql -y --skip-broken

RUN cp /s3cmd/s3cmd-2.0.2/httpd-foreground /usr/local/bin/
RUN cp /s3cmd/s3cmd-2.0.2/runChecks.sh /root/
RUN chmod +x /root/runChecks.sh

RUN yum install httpd -y

CMD ["httpd-foreground"]
