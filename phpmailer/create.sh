# PHPmailer vulnerability

container_name=first_website_$1
docker run --rm -idt --name $container_name ubuntu

docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

# copy the website.
docker cp ./www $container_name:/home/www
docker exec $container_name php -S 0.0.0.0:80 -t /home/www