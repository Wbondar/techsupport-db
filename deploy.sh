source credentials.conf

echo 'Trying to deploy baseline on the database server.'
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD < baseline.sql > logs/deployment.log $DATABASE