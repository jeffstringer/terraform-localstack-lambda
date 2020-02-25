#!/usr/bin/env bash -x

cd ..
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker-compose up
