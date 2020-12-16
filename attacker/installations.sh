
# The Attacker VM:
# Add atacker user

adduser attacker
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


# Exploits
cd /home/attacker
mkdir exploits
cd exploits
	
	# The ssh vulnerability.
	pip3 install paramiko==2.0.8
	git clone https://github.com/blacknbunny/CVE-2018-10933.git

	# The proftp vulnerability
	git clone https://github.com/t0kx/exploit-CVE-2015-3306.git
	rm -rf exploit-CVE-2015-3306/Dockerfile
	git clone https://github.com/thegingerninja/ProFTPd_1_3_5_mod_copy_exploit.git
	# In metasploit:
	# set payload cmd/unix/reverse_python

	