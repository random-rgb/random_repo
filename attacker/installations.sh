
# The Attacker VM:
# Add atacker user

adduser attacker
cd /home/attacker
apt update
apt install -y python2 python3 python3-pip nmap xxd net-tools gcc wget curl iputils-ping vim php openssh-server tcpdump netcat apache2 tree git
service apache2 start
service ssh start
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
python2 get-pip.py
python2 -m pip install requests flask flask-cors
pip3 install requests flask flask-cors

# Cheatsheets
mkdir Cheatsheets
cd Cheatsheets

	# Something about how to use python requests.
	# python3; import requests; help(requests)

	# Something about apache.
	mkdir apache2
	cd apache2
	wget -E -H -k -K -p "https://httpd.apache.org/docs/2.4/getting-started.html" 
	cd ..

	# Something about Flask

	Metasploit
	mkdir metasploit
	cd metasploit
	wget -E -H -k -K -p "https://www.tutorialspoint.com/metasploit/metasploit_quick_guide.htm" 

	wget -E -H -k -K -p "https://www.tutorialspoint.com/metasploit/metasploit_quick_guide.htm" 

	wget -E -H -k -K -p "https://www.offensive-security.com/metasploit-unleashed/msfconsole-commands/"

	cd ..

	# Meterpreter from php shell
	mkdir php_webshell_to_meterpreter
	cd php_webshell_to_meterpreter
	wget -E -H -k -K -p "https://www.hackingarticles.in/webshell-to-meterpreter/"
	cd ..

	# Nmap
	mkdir nmap
	cd nmap
	wget -E -H -k -K -p "https://www.stationx.net/nmap-cheat-sheet/"
	cd ..


	# msfvenum
	mkdir msfvenum
	cd msfvenum
	wget -E -H -k -K -p "https://redteamtutorials.com/2018/10/24/msfvenom-cheatsheet/"
	cd ..

	# Hashcat

	# hydra
	mkdir hydra
	cd hydra
	wget -E -H -k -K -p "https://redteamtutorials.com/2018/10/25/hydra-brute-force-techniques/"
	cd ..

	# gobuster from red team toturials.

# Other tools
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

	# Web Tools
	# sqlmap
	# wpscan
	# joomscan
	# urlfuzzer

	# Word lists for brute forcing.

	# Beef installation:
	cd /home/attacker/tools
	git clone https://github.com/beefproject/beef.git
	cd beef
	apt upadte
	apt-get clean && apt-get update && apt-get install -y locals
	echo "LC_ALL=en_US.UTF-8" >> /etc/enviroment
	echo "en_US.UTF-8" >> /etc/local.gem
	echo "LANG=en_US.UTF-8" > /etc/local.conf
	local-gen en_US.UTF-8
	# inside ./install replace all sudo with nothing
	python3 -c "x = open('./install', 'r'); data=x.read(); x.close(); open('./install', 'w').write(data.replace('sudo ', ''))" 
	chmod +x ./install
	./install
	bundle install
	# Should set time to new york
	# need to change the username and password.
	# ./beef
	cd ..

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

	# The phpmail vulnerability.
	git clone https://github.com/opsxcq/exploit-CVE-2016-10033.git

	# The sambacry exploit
	git clone https://github.com/opsxcq/exploit-CVE-2017-7494.git

	# The zip slip vulnerability
	git clone https://github.com/cesarsotovalero/zip-slip-exploit-example.git