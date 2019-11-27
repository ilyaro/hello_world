FROM centos:latest

MAINTAINER ilyaro

RUN yum install -y python3
RUN yum install -y wget
RUN wget ftp://fr2.rpmfind.net/linux/dag/redhat/el7/en/x86_64/dag/RPMS/stress-1.0.2-1.el7.rf.x86_64.rpm
RUN yum localinstall stress-1.0.2-1.el7.rf.x86_64.rpm
WORKDIR /
RUN python -m pip install --upgrade pip
RUN pip install flask
RUN python3 -m venv venv
RUN pip freeze
RUN source venv/bin/activate

COPY ./app /

ENTRYPOINT [ "python3" ]

CMD [ "app/hello.py" ]