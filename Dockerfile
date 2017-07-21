FROM httpd:alpine

ARG HOOK_URL=n01shway3ly8ix149osx

RUN apk add -U docker git sudo && \
    sed -i 's/#LoadModule cgid_module modules\/mod_cgid\.so/LoadModule cgid_module modules\/mod_cgid\.so/' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's/#LoadModule cgi_module modules\/mod_cgi\.so/LoadModule cgi_module modules\/mod_cgi\.so/' /usr/local/apache2/conf/httpd.conf && \
    echo "AddHandler cgi-script .cgi" >> /usr/local/apache2/conf/httpd.conf && \
    echo "ScriptAlias /${HOOK_URL} \"/usr/local/apache2/cgi-bin/\"" >> /usr/local/apache2/conf/httpd.conf && \
    rm /usr/local/apache2/cgi-bin/*

COPY *.sh /opt/

RUN echo "daemon ALL=(ALL) NOPASSWD:/opt/site_max.sh" >> /etc/sudoers

COPY hook.cgi /usr/local/apache2/cgi-bin/
