FROM openjdk:8u171-jre-alpine
# set deployment directory
WORKDIR /app
# copy over the built artifact along with webaapp-runner file
COPY target/hellojavawebapprunner.war target/dependency/webapp-runner-7.0.57.1.jar ./
CMD java $JAVA_OPTIONS -jar webapp-runner-7.0.57.1.jar --port $PORT hellojavawebapprunner.war