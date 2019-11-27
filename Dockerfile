FROM centos:latest

MAINTAINER ilyaro

RUN yum install -y python3
RUN yum install -y stress
WORKDIR /
RUN python -m pip install --upgrade pip
RUN pip install flask
RUN python3 -m venv venv
RUN pip freeze
RUN source venv/bin/activate

COPY ./app /

ENTRYPOINT [ "python3" ]

CMD [ "app/hello.py" ]