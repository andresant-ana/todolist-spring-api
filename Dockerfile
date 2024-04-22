FROM maven:3.8-jdk-17 AS builder

WORKDIR /app

COPY pom.xml ./
RUN mvn package

FROM openjdk:17-alpine

WORKDIR /app

COPY C:/Users/logonrmlocal/Desktop/todo-list/out/artifacts/todo_list_jar.jar ./

ENV ORACLE_JDBC_DRIVER=/oracle/jdbc/ojdbc8/ojdbc8.jar
COPY $ORACLE_JDBC_DRIVER /opt/oracle/jdbc

ENV ORACLE_SID=cdb1
ENV ORACLE_USERNAME=rm551575
ENV ORACLE_PASSWORD=060598

EXPOSE 80

CMD ["java", "-jar", "todo_list_jar.jar"]

