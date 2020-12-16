# raise and configure all the containers

./attacker/create.sh $1
./firmware_sidechannel/create.sh $1
./phpmailer/create.sh $1
./python_sandbox_escape/create.sh $1

# turn all running containers to images.
# docker commit container_id image name

# turn containers into images.
# docker save -o image_file image_tag

# To load the docker image

# Do Chmod +x to everything nessesarry.

