

# TEST 2

OPTIONAL (clear the entire Environtment):
    1. We will remove all the container and images (Be careful!!)
       - docker stop $(docker ps -a -q)
       - docker rm $(docker ps -a -q)
       - docker rmi $(docker images -q)
    2. We will use docker network name box-billing-net , so if already found remove it first
       - docker network ls
       - docker network rm box-billing-net 


Pre Assume: Using Ubuntu 20.04 and already installed Git

1. Go to folder /src, and clone from the repository:
   ' git clone https://github.com/boxbilling/boxbilling.git . '

2. Go to root folder again ' cd .. ', and Copy folder /landingpage to /src/src :
    '  cp -R ./landingpage ./src/src '

3. execute bash:
    ' docker run -d -p 9000:9000 -v "$PWD"/src:/var/www/html  -w /var/www/html/src --name php --network box-billing-net php:fpm-alpine '

4. In root folder and then execute:
   ' docker build -t box-billing-app . '

5. In root folder and then execute: 
   ' docker run -d -p 8004:80 --name box-bill-app --network box-billing-net box-billing-app '

6. Access Browser : ' localhost:8004 ', check if the site is working

7. (BIG POINT) , access browser: "localhost:8004/landingpage"

8. In root folder, and execute: 
    ' docker exec -w /var/www/html/src php sh -c "curl --silent --show-error https://getcomposer.org/installer | php " '

9.  execute: ' docker exec php php composer.phar install '

10. (BIG POINT) And last in root folder, execute: ' docker-compose up -d '