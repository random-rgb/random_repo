# Create attacker:
container_name=python_sandbox_$1
docker run --rm -idt --name $container_name ubuntu
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

# upload the server and run it.