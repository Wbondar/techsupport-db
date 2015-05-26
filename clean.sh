source credentials.conf

echo "Trying to remove database schema $DATABASE and user $CLIENT_USERNAME from the development server."
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "DROP USER '$CLIENT_USERNAME'@'$HOST'; DROP DATABASE $DATABASE;"