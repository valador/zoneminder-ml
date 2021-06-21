#!/bin/bash

# Setup timezone
echo "Setting the timezone: ${TZ}"
if [[ $(cat /etc/timezone) != "${TZ}" ]]; then
	echo "$TZ" > /etc/timezone
	ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata
fi

echo "Create zm config based on env variables"
rm -f /etc/zm/conf.d/20-zm.conf
for kv in $(env | grep "ZM_"); do
  echo "${kv}" >> /etc/zm/conf.d/20-zm.conf
done
cat /etc/zm/conf.d/20-zm.conf
# Пофиксить генерацию конфига
echo "Create zmen config (secrets.ini) based on env variables"
rm -f /etc/zm/secrets.ini
env | grep "ZMEN_"
for kv in $(env | grep "ZMEN_"); do
  echo "${kv/ZMEN_}" >> /etc/zm/secrets.ini
done
cat /etc/zm/secrets.ini

# Init tokens.txt if it does not exist
if [ ! -f /var/lib/zmeventnotification/push/tokens.txt ]
then
  echo "{}" > /var/lib/zmeventnotification/push/tokens.txt
fi

# Set permissions on important directories
# chown -R www-data:www-data \
#   /var/lib/zmeventnotification

exec "$@"
