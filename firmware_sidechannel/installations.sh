# installations.sh for zip slip vulnerability.
adduser fileserver
cd /home/fileserver
apt update
apt install -y curl tar

curl -O https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz
tar -xvzf Python-3.6.0.tgz
cd Python-3.6.0
./configure
make
sudo make install

# need to install ftp server on user with weak creds.