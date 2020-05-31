# Mail server 

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Sources](#sources)
* [Setup](#setup)

## General info
Mail project contain 4 volumes:
 * *mysql* contain mail database. There are only accounts, aliases and domains 
 * *privkey1.pem* and *fullchain1.pem* are keys from example Letsencrypt. MY.DOMAIN: imap.MY.DOMAIN and smtp.MY.DOMAIN
 * *vhosts*. There are saved e-mails

If we want set our domain as mail server, we need set domain zone in DNS server and it's two subdomains: *imap* and *smtp*.
Additionally we need set reverse dns. I created server DNS. Examples of configuration files are in my repository. 

Mail and database containers are in network mode. 
 
## Sources 

[https://pl.terminal28.com/integracja-spf-policy-debianubuntu#Instalacja_spf-policy_pod_python8217a]

[https://wiki.debian.org/opendkim]

[https://www.digitalocean.com/community/tutorials/how-to-configure-a-mail-server-using-postfix-dovecot-mysql-and-spamassassin]






