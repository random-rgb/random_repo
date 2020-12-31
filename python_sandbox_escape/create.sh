container_name=python_sandbox_$1

echo "Creating Python sandbox with name " $container_name

# Hash cracking.
python2 -c "print bytearray([0x82,0x19,0x20,0x88,0x75,0x64])" > ./hash_breaking/bamba_secret_key.key
cat ./hash_breaking/bamba_secret.txt | python2 ./hash_breaking/bamba_secret_encrypt.py > ./hash_breaking/bamba_recipy.enc
docker cp ./hash_breaking/bamba_recipy.enc $container_name:/home/bamba_recipy.enc
docker cp ./hash_breaking/bamba_secret_encrypt.py $container_name:/home/bamba_secret_encrypt.py
docker cp ./hash_breaking/bamba_secret_encrypt.py $container_name:/home/bamba_secret_encrypt.py

docker run --rm -idt --name $container_name ubuntu
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

# upload the server and run it.
docker cp ./server.py $container_name:/home/server.py
docker exec -d $container_name python3 /home/server.py