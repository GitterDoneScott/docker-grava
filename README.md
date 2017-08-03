Dockerfile for creating a docker image to download Strava data using Grava and import it into InfluxDB.

Refer to authentication instructions here: https://github.com/rotti/grava

To build image

docker build --build-arg CLIENT_ID=<YOUR CLIENT ID> --build-arg STRAVA_SECRET=<YOUR STRAVA SECRET> --build-arg AUTH_CODE=<YOUR AUTH CODE> --build-arg INFLUXDB_HOST=<YOUR INFLUX HOST IP> .

To fetch new data

docker run <contianer name> 
