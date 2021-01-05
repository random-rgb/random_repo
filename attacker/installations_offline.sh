
# The Attacker VM:
# Add atacker user
apt update
apt install -y nmap xxd net-tools gcc wget curl iputils-ping vim openssh-server tcpdump netcat tree git simpleproxy sudo 

service ssh start
