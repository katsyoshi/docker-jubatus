FROM ubuntu
MAINTAINER MATSUMOTO Katsuyoshi, github@katsyoshi.org

RUN echo "deb http://download.jubat.us/apt binary/" >> /etc/apt/sources.list.d/jubatus.list
RUN apt-get update
RUN apt-get install jubatus --force-yes -y
ENV JUBATUS_HOME /opt/jubatus
ENV PATH ${JUBATUS_HOME}/bin:${PATH}
ENV LD_LIBRARY_PATH ${JUBATUS_HOME}/lib:${LD_LIBRARY_PATH}
ENV LDFLAGS -L${JUBATUS_HOME}/lib ${LDFLAGS}
ENV CPLUS_INCLUDE_PATH ${JUBATUS_HOME}/include:${CPLUS_INCLUDE_PATH}
ENV PKG_CONFIG_PATH ${JUBATUS_HOME}/lib/pkgconfig:${PKG_CONFIG_PATH}
RUN mkdir /var/jubatus/
ADD app.json /var/jubatus/jubatus.json

CMD jubaclassifier -f /var/jubatus/jubatus.json