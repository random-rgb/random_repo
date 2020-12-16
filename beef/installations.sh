
# The Attacker VM:
# Add atacker user

adduser beefuser
cd /home/beefuser
apt update
apt install -y gcc git python3

# Beef installation:
cd /home/beefuser
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

