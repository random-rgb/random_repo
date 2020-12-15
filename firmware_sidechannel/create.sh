# Create attacker:
container_name=firmware_$1
docker run --rm -idt --name $container_name ubuntu
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh