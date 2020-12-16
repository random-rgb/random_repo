# Create attacker:
container_name=firmware_$1
docker run --rm -idt --name $container_name ubuntu
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

docker cp ./webserver/* $container_name:/home/webserver

docker exec -it $container_name mkdir /home/files
docker cp ftpserver.py $container_name:/home/files/ftpserver.py