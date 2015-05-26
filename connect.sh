source credentials.conf

echo 'Trying to connect to the development database server...'
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD $DATABASE