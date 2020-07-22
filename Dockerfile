FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less
RUN apt-get install -y postgresql
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install Flask
RUN pip install Flask-SQLAlchemy
RUN pip install Flask-Script
RUN pip install coverage

COPY ./flask ./flask
WORKDIR /flask


RUN python manage.py init_db
ENTRYPOINT python server.py