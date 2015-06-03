source credentials.conf

echo 'Trying to connect to the development database server...'
if [ $1'x' != 'x' ]; then
	if [ $2'x' != 'x' ]; then
    	mysql --user=$DATABASE_USER_PREFIX$1 --password=$2 --host=$HOST $DATABASE 
    else 
    	mysql --user=$DATABASE_USER_PREFIX$1 --password=$1 --host=$HOST $DATABASE 
    fi
else 
	mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD --host=$HOST $DATABASE 
fi