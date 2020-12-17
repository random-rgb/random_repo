container_name=python_sandbox_$1

echo "Creating Python sandbox with name " $container_name

docker run --rm -idt --name $container_name ubuntu
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

# upload the server and run it.
docker cp ./server.py $container_name:/home/server.py
docker exec $container_name python3 /home/server.py