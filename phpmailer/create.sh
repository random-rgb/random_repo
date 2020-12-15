# PHPmailer vulnerability

# https://github.com/opsxcq/exploit-CVE-2016-10033.git
chmod 777 main.sh
docker build --tag first_webserver_base_image .
docker run --rm -it --name first_webserver_$1 -p 8080:80 first_webserver_base_image