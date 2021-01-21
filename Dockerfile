FROM amazonlinux:2

ARG cb_version=3.0.5

COPY couchbase.repo /etc/yum.repos.d/
RUN amazon-linux-extras enable php7.4 \
 && yum install -y php php-devel php-pear \
      make gcc pkgconfig unzip \

RUN yum install -y libcouchbase-devel \
 && pecl install couchbase-3.0.5 \
 && echo "extension=couchbase.so" > /etc/php.d/50-couchbase.ini

ENTRYPOINT []
