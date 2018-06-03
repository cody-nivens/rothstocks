#!/bin/bash

#docker build -t 127.0.0.1:30400/rothstocks:latest -f Dockerfile ../RothStocks
docker build -t 127.0.0.1:30400/rothstocks:latest -f Dockerfile ../RothStocks && docker push 127.0.0.1:30400/rothstocks:latest
