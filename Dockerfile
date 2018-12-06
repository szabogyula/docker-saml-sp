# szabogyula/saml-sp
FROM php:7.2.0-apache-stretch

# install required packages
RUN apt-get update && \
    apt-get install -yq git libapache2-mod-shib2 && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep

# configure shibboleth sp
ADD docker-config/shibboleth/shibboleth2.xml      /etc/shibboleth/
ADD docker-config/shibboleth/attribute-configs    /etc/shibboleth/attribute-configs
ADD docker-config/shibboleth/shibd.logger         /etc/shibboleth/
ADD docker-config/shibboleth/cert                 /etc/shibboleth/

#configure apache
ADD docker-config/apache_cert/*                  /etc/apache2/cert/
ADD docker-config/apache_config/default-ssl.conf /etc/apache2/sites-available
ADD docker-config/apache_content/secure          /var/www/html/secure
RUN a2ensite default-ssl && a2dissite 000-default && a2enmod ssl && a2enmod rewrite

# install the runner
ADD docker-config/run.sh /run.sh

EXPOSE 80 443
CMD /usr/local/bin/ep -v /etc/apache2/sites-available/default-ssl.conf /etc/shibboleth/shibboleth2.xml -- /run.sh
