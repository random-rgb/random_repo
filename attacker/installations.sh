
# The Attacker VM:
# Add atacker user

passwd
adduser attacker
usermod -a -G sudo attacker
cd /home/attacker
apt update
apt install -y python2 python3 python3-pip nmap xxd net-tools gcc wget curl iputils-ping vim php openssh-server tcpdump netcat apache2 tree git simpleproxy
service apache2 start
service ssh start
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
python2 get-pip.py
python2 -m pip install requests flask flask-cors
pip3 install requests flask flask-cors

# Tools
cd /home/attacker
mkdir tools
cd tools

	# The php webshell
	git clone https://github.com/WhiteWinterWolf/wwwolf-php-webshell.git

	# Metasploit installer
	mkdir metasploit_installer
	cd metasploit_installer
	curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
	chmod +x msfinstall
	./msfinstall	

	# Hashcat
	apt install -y hashcat

	# Hydra
	apt-get install -y hydra hydra-gtk

