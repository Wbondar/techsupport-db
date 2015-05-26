source credentials.conf

echo "Trying to create database schema $DATABASE."
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "CREATE DATABASE $DATABASE;"