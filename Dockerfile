FROM openjdk:8
LABEL maintainer="#coixinet <hola@coixinet.com>"

WORKDIR /opt/www626

ENV LIFERAY_HOME=/opt/www626/liferay-portal-6.2-ce-ga6
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-7.0.62
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_TOMCAT_URL=https://cdn.lfrs.sl/releases.liferay.com/portal/6.2.5-ga6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip

RUN apt-get -qq update && \
  apt-get -qq install telnet && \
  apt-get -qq clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  useradd -ms /bin/bash liferay && \
  set -x && \
  mkdir -p $LIFERAY_HOME && \
  curl -fSL "$LIFERAY_TOMCAT_URL" -o liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip && \
  unzip liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip && \
  rm liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip && \
  rm -rf $CATALINA_HOME/work/* && \
  mkdir -p $LIFERAY_HOME/data/document_library && \
  mkdir -p $LIFERAY_HOME/data/elasticsearch/indices

COPY ./configs/setenv.sh $CATALINA_HOME/bin/setenv.sh

RUN chown -R liferay:liferay $LIFERAY_HOME
RUN chown -R liferay:liferay $CATALINA_HOME
RUN ["chmod", "+x", "$CATALINA_HOME/bin/catalina.sh"]


USER liferay

EXPOSE 8080


ENTRYPOINT ["catalina.sh", "run"]
