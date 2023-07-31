FROM alpine:latest

WORKDIR .

RUN apk update && apk add openjdk11 wget

RUN wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.0-M9/bin/apache-tomcat-11.0.0-M9.tar.gz && mkdir /opt/tomcat && tar xvzf apache-tomcat-11.0.0-M9.tar.gz --strip-components 1 --directory /opt/tomcat

COPY . .

RUN cp petclinic.war /opt/tomcat/webapps/

EXPOSE 8080

CMD ["/opt/tomcat/bin/startup.sh"]
