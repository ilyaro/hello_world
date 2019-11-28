FROM centos:latest

MAINTAINER ilyaro

RUN yum install -y python3
RUN yum install -y wget
RUN wget ftp://fr2.rpmfind.net/linux/dag/redhat/el7/en/x86_64/dag/RPMS/stress-1.0.2-1.el7.rf.x86_64.rpm
RUN yum localinstall -y stress-1.0.2-1.el7.rf.x86_64.rpm
WORKDIR /
RUN python3 -m pip install --upgrade pip
RUN pip install flask

RUN mkdir app
COPY ./app app

ENTRYPOINT [ "python3" ]

CMD [ "app/hello.py" ]
