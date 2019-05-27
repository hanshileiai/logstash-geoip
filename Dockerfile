FROM logstash:6.8.0

USER root

RUN yum update -y && \
  yum install -y wget && \
  cd /usr/local/src/ && \
  wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && \
  rpm -ivh epel-release-6-8.noarch.rpm && \
  yum makecache && \
  yum repolist && \
  yum install -y geoipupdate && \
  echo "ProductIds GeoLite2-City" >> /etc/GeoIP.conf && \
  geoipupdate && \
  yum clean all