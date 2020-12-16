# Create attacker:
container_name=attacker_$1
docker run --rm -idt --name $container_name ubuntu
docker cp ./installations.sh $container_name:/home/installations.sh
docker exec -it $container_name sh /home/installations.sh

# Change the phpmailer exploit:
docker cp new_phpmailer_arg_injection.rb $container_name:/opt/metasploit-framework/embedded/framework/modules/exploits/multi/http/phpmailer_arg_injection.rb
