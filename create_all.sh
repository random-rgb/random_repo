# raise and configure all the containers

chmod +x ./attacker/create.sh
chmod +x ./attacker/installations.sh

chmod +x ./firmware_sidechannel/create.sh
chmod +x ./firmware_sidechannel/installations.sh

chmod +x ./phpmailer/create.sh
chmod +x ./phpmailer/installations.sh

chmod +x ./python_sandbox_escape/create.sh
chmod +x ./python_sandbox_escape/installations.sh

cd attacker 
./create.sh $1
cd ..

cd firmware_sidechannel 
./create.sh $1
cd ..

cd phpmailer 
./create.sh $1
cd ..

cd python_sandbox_escape 
./create.sh $1
cd ..

# turn all running containers to images.
# docker commit container_id image name

# turn containers into images.
# docker save -o image_file image_tag

# To load the docker image

# Do Chmod +x to everything nessesarry.

