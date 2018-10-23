FROM java:8
RUN mkdir -p /usr/src/myapp
WORKDIR .
ADD ./target/config-server-0.0.1-SNAPSHOT.jar /usr/src/myapp/config-server-0.0.1-SNAPSHOT.jar
WORKDIR /usr/src/myapp
VOLUME /tmp
EXPOSE 9090
#RUN java -jar coe-spring-web-0.1.0.jar
CMD java -jar config-server-0.0.1-SNAPSHOT.jar
