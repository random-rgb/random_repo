# installations.sh for zip slip vulnerability.
apt update
apt install -y curl tar python2 gcc net-tools
curl https://bootstrap.pypa.io/get-pip.py --output /home/get-pip.py
python2 home/get-pip.py
python2 -m pip install requests flask flask-cors Flask-Scss pyftpdlib 

gcc /home/webserver/authentication.c -o /home/webserver/authentication_provider
rm -rf /home/webserver/authentication.c

gcc /home/webserver/write_log.c -o /home/webserver/write_log
rm -rf /home/webserver/write_log.c
