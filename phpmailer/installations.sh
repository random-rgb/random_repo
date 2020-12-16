
# The Attacker VM:
# Add atacker user

apt update
apt install -y php

php -S 0.0.0.0:80 index.php
