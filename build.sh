#!/usr/bin/env bash
./gradlew build
docker build -t wvnn/web .
docker run -p 8080:8080 wvnn/web
