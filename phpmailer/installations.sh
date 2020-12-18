
# The Attacker VM:
# Add atacker user

apt update
apt install -y php python3 net-tools
python3 -c "print('123\n123')" | adduser moses
