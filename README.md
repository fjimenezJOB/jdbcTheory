# JDBC Theory WebApp
Es un proyecto simple para la practica de Java JSP con conexion a base de datos ClearDB de Heroku.
## Funciones:
- Insertar invitados en la base de datos (Nombre, Apellidos y Gmail)
- Enseñar una lista de los invitados
- Hacer Update y Delete de los invitados
- Enseñar una lista de la tabla de Productos

En las proximas actualizaciones también tendrá conexion con una base de datos de MongoDB.

## Para ejecutarlo desde la terminal sin la instalación de Tomcat, ya que tomcat está embebido por webapprunner.

### Terminal en el directorio del proyecto, ejecutamos los siguientes comandos:
- java -jar target/dependency/webapp-runner-7.0.57.1.jar --port 8080 target/webapp.war

## Para Ejecutarlo en tu docker local: (siempre ejecutas estos comandos en el directorio de la dockerfile)
(Cambia "dockerHubUser" por tu usuario de DockerHub)
- mvn clean package

- docker build -t dockerHubUser/webapp:1.0 .

- docker run -p 8081:8080 -e PORT=8080 dockerHubUser/webapp:1.0

Mi Link de DockerHub: https://hub.docker.com/repository/docker/fjimenezjob/webapp

## Para Realizar un deploy a Heroku (siempre ejecutas estos comandos en el directorio de la dockerfile)

- mvn clean package

- heroku login

Con tu Docker local arrancado ejecuta los siguientes comandos:
- heroku container:login

(Cambia "nombreApp" por el nombre de tu app en Heroku)
- heroku container:push web --app nombreApp

- heroku container:release web --app nombreApp

- heroku open --app nombreApp

Mi link de Heroku: https://javafirstwebapp.herokuapp.com/index.jsp