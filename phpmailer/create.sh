# PHPmailer vulnerability

container_name=first_website_$1
docker run --rm -idt --name $container_name ubuntu
# copy the website.
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

