source credentials.conf
DATA='data.sql'

cat data/* > $DATA

echo 'Trying to populate develoopment database schema.'
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD < $DATA > logs/population.log $DATABASE