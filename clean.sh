source credentials.conf

echo "Trying to remove database schema $DATABASE."
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "DROP DATABASE $DATABASE;"