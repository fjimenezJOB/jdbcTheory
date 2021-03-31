Hello Java Webapp Runner
------------------------

This is a template project for a Java webapp that runs on Tomcat and uses a Maven build to manage the Tomcat dependency.

[More info about this](http://www.jamesward.com/2012/02/15/webapp-runner-apache-tomcat-as-a-dependency)

[![Deploy on Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/jamesward/hello-java-webapp_runner)


-Para ejecutarlo desde la Commandline sin la instalación de Tomcat, ya que tomcat está embebido por
webapprunner.

C:\Users\jordi\Downloads\webapprunner\hello-java-webapp_runner-master>
java -jar target/dependency/webapp-runner-7.0.57.1.jar --port 8080 target/hellojavawebapprunner.war

-Para Ejecutarlo en tu docker local (siempre ejecutas estos comandos en el directorio de la dockerfile)

mvn clean package

docker build -t jordiascension/hello-java:1.0 .

docker run -p 8081:8080 -e PORT=8080 jordiascension/hello-java:1.0  

-Para Realizar un deploy a Heroku (siempre ejecutas estos comandos en el directorio de la dockerfile)

mvn clean package

heroku login

heroku container:login

- Aquí debes de poner el nombre de tu app

heroku container:push web --app myfirst-bit-webapp

heroku container:release web --app myfirst-bit-webapp

-url de mi heroku con mi docker container:

https://myfirst-bit-webapp.herokuapp.com/
