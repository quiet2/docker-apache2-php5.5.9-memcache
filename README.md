docker build --no-cache -t apache2-php5.5.9-memcache .
docker images
docker volume create --name www
docker volume inspect www
echo '<?php phpinfo();' > /var/lib/docker/volumes/www/_data/index.php

docker run -d -v www:/var/www/html --name php5 -p 8080:80  apache2-php5.5.9-memcache
docker ps -a
lynx localhost:8080
docker exec -it <CONTAINER ID> /bin/bash
