# syntax=docker/dockerfile:1

FROM python:3

RUN apt-get update -y && \
apt-get upgrade -y

ENV DHOME = home/server/

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN mkdir -p $DHOME

WORKDIR $DHOME

#RUN apt-get install python3-pip

RUN pip3 install --upgrade pip

RUN pip3 install pipenv

COPY ./run.sh         . 
COPY ./deploy.sh      .
COPY ./Pipfile        .
COPY ./Pipfile.lock   .

RUN ./deploy.sh isignos

CMD ["./run.sh", "isignos"]

EXPOSE 8000

