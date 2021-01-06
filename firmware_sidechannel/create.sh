# Create attacker:
container_name=firmware_$1
docker run --rm -idt --name $container_name ubuntu


docker cp ./webserver $container_name:/home/webserver
docker exec -it $container_name mkdir /home/camera_configuration
docker cp ./admin_pass.txt $container_name:/home/camera_configuration/admin_pass.txt

docker cp ./ftpserver.py $container_name:/home/ftpserver.py

docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

# run the webserver
docker exec -d $container_name python2 /home/webserver/webserver.py

# run the ftp server 
docker exec -d $container_name python2 /home/ftpserver.py

