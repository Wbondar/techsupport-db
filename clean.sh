source credentials.conf

echo "Trying to remove database schema $DATABASE and it's specific users from the development server."
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "DELETE FROM mysql.user WHERE user LIKE '$DATABASE_USER_PREFIX%';" $DATABASE
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "DROP DATABASE $DATABASE;"