FROM arm32v7/debian:10

RUN VARIABLE="postfix postfix/main_mailer_type string 'Internet Site'"

RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'postfix postfix/mailname string MY.DOMAIN'; debconf-set-selections <<< $VARIABLE"]

RUN chown root:root /tmp
RUN chmod ugo+rwXt /tmp

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    postfix \
    postfix-mysql \
    dovecot-core \
    dovecot-imapd \
    dovecot-lmtpd \
    dovecot-mysql \
    rsyslog \
    postfix-policyd-spf-python \
#    opendkim \
#    opendkim-tools \
    spamassassin \
    spamc 

# OPENDKIM
#RUN mkdir /etc/opendkim
#COPY opendkim.conf /etc/
#COPY TrustedHosts /etc/opendkim/
#COPY opendkim /etc/default/
#RUN adduser postfix opendkim
#RUN mkdir -p /etc/opendkim/keys/MY.DOMAIN
#RUN chown opendkim:opendkim -R /etc/opendkim
#COPY KeyTable /etc/opendkim
#COPY SigningTable /etc/opendkim


COPY hosts /etc/


#COPY privkey1.pem /etc/ssl/private/
#COPY fullchain1.pem /etc/ssl/certs/


COPY main.cf /etc/postfix/

COPY mysql-virtual-mailbox-domains.cf /etc/postfix/
COPY mysql-virtual-mailbox-maps.cf /etc/postfix/
COPY mysql-virtual-alias-maps.cf /etc/postfix/

COPY master.cf /etc/postfix/
# dovecot
COPY dovecot.conf /etc/dovecot/
COPY 10-mail.conf /etc/dovecot/conf.d/

RUN mkdir -p /var/mail/vhosts/MY.DOMAIN
RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /var/mail

RUN chown -R vmail:vmail /var/mail

COPY 10-auth.conf /etc/dovecot/conf.d/

COPY auth-sql.conf.ext /etc/dovecot/conf.d/

COPY dovecot-sql.conf.ext /etc/dovecot/

RUN chown -R vmail:dovecot /etc/dovecot
RUN chmod -R o-rwx /etc/dovecot 

COPY 10-master.conf /etc/dovecot/conf.d/

COPY 10-ssl.conf /etc/dovecot/conf.d/

COPY wait-for-it.sh /
RUN chmod +x /wait-for-it.sh


#SPAMASSSASSIN
RUN adduser --disabled-password --gecos "" spamd
COPY spamassassin /etc/default/
RUN update-rc.d spamassassin enable
COPY local.cf /etc/spamassassin/



COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
