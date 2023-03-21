#!/bin/bash

echo "=> Updating the operating system..."
apt-get update -y
apt-get upgrade -y

echo "=> Installing openssl..."

apt-get install openssl

echo "=> Creating directories..."

mkdir -p /company/public
mkdir -p /company/admin
mkdir -p /company/sales

echo "=> Creating user groups..."

groupadd GRP_ADMIN
groupadd GRP_SALES

echo "=> Creating users..."

new_users=('carlos' 'maria' 'joao' 'debora' 'roberto' 'admin')

for user in ${new_users[@]}; do
  echo "=> Adding $user..."

  if [[ $user == "admin" ]]; then
    useradd $user -m -s /bin/bash -p $(openssl passwd MoreSecurePassword123) -G GRP_ADMIN
  else
    useradd $user -m -s /bin/bash -p $(openssl passwd Password123) -G GRP_SALES
  fi
done

echo "=> Specifying directories' permissions..."

chown root:GRP_ADMIN /company/admin
chown root:GRP_SALES /company/sales

chmod 770 /company/admin
chmod 770 /company/sales
chmod 777 /company/public

echo "=> Listing directory permissions..."

ls -l /company

echo "=> Finished."
