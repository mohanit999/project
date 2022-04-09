# FROM directive - Select Base Image
FROM openjdk:11 AS build-step

# ENV directive - Set Environment Variable
ENV APP_PATH /opt/java/mycalculator

# RUN directive - run commands
RUN mkdir -p "$APP_PATH"

# WORKDIR directive - set path to execute
WORKDIR $APP_PATH

# COPY directive - Copy From Host To Image
COPY . /opt/java/mycalculator

# RUN directive - run commands
RUN openjdk-8-jdk install
RUN openjdk-8-jre install
RUN maven install

# RUN directive - run commands
RUN mvn validate
RUN mvn package

# From directive - Select Base Image
FROM tomcat:alpine

# COPY directive - Copy From Host To Image
COPY --from=build-step /opt/java/mycalculator/target/WebAppCal /usr/local/tomcat/webapps/

