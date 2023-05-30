# Build stage
FROM gradle:latest AS BUILD
WORKDIR /
COPY . . 
RUN gradle build

# Package stage
FROM eclipse-temurin:17-jdk-alpine
ENV JAR_NAME=/build/libs/wvnn-0.0.1.jar
WORKDIR /
COPY --from=BUILD $JAR_NAME /app.jar
VOLUME /tmp
EXPOSE 8080
ENTRYPOINT exec java -jar /app.jar