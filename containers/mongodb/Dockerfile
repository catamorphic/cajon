FROM stackbrew/ubuntu:precise

RUN apt-get update -q

# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list
RUN apt-get update -q
RUN mkdir -p /data/db

# Install MongoDB
RUN apt-get install -q -y mongodb-10gen=2.4.8

ENTRYPOINT ["mongod"]