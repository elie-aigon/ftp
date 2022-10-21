#!/bin/bash

apt install git-all -y
git clone https://github.com/elie-aigon/fichier.conf.git
#configuration du serveur FTP
apt update & apt upgrade
apt install proftpd-* -y
apt install openssl -y
mkdir /etc/proftpd/ssl
echo -ne "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd-rsa.pem -keyout /etc/proftpd/ssl/proftpd-key.pem
systemctl start proftpd
systemctl enable proftpd


#modification desfichier .conf

mv /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.backup
mv /etc/proftpd/tls.conf /etc/proftpd/tls.conf.backup
mv /etc/proftpd/modules.conf /etc/proftpd/modules.conf.backup

cp /fichier.conf/fichier.conf/proftpd.conf /etc/proftpd/
cp /fichier.conf/fichier.conf/tls.conf /etc/proftpd/
cp /fichier.conf/fichier.conf/modules.conf /etc/proftpd/

systemctl restart proftpd
