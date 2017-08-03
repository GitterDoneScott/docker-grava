FROM python:2.7.13-wheezy
MAINTAINER gitterdone
ARG CLIENT_ID
ARG STRAVA_SECRET
ARG AUTH_CODE
ARG INFLUXDB_HOST

RUN apt-get update -y && apt-get install -y git && apt-get clean

RUN git clone https://github.com/rotti/grava.git

RUN echo "$CLIENT_ID" > /grava/authfiles/client_id
RUN echo "$STRAVA_SECRET" > /grava/authfiles/strava_secret
RUN echo "$AUTH_CODE" > /grava/authfiles/auth_code

RUN pip install influxdb stravalib request

RUN cd /grava && python token_helper.py

RUN sed -i 's/influxhost =.*$/influxhost = '"\""$INFLUXDB_HOST"\""'/' /grava/grava_init_backend.py

RUN head -n 20 /grava/grava_init_backend.py
CMD cd /grava && python grava_init_backend.py
