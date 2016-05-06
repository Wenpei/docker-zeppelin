FROM ubuntu:14.04
MAINTAINER Wenpei <yuwenp@cn.ibm.com>

RUN apt-get -y update
RUN apt-get -y install default-jdk
RUN apt-get -y install maven
RUN git clone https://github.com/apache/incubator-zeppelin.git /zeppelin
WORKDIR /zeppelin
RUN mvn clean package -Pcassandra-spark-1.5 -Dhadoop.version=2.6.0 -Phadoop-2.6 -DskipTests
EXPOSE 8080
CMD ["bin/zeppelin.sh", "start"]
