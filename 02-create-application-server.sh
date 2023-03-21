#!/bin/bash

apt-get update -y
apt-get upgrade -y

apt-get install apache2 -y

sh -c 'echo "<html><title>Test</title><body><h1>Apache is running!</h1></body></html>" > /var/www/html/index.html'

echo "Finished."