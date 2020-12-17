# installations.sh for zip slip vulnerability.
adduser fileserver
cd /home/fileserver
apt update
apt install -y curl tar python2 gcc
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
python2 get-pip.py
python2 -m pip install requests flask flask-cors pyftpdlib

