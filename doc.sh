source credentials.conf

java -jar schemaSpy_5.0.0.jar -t mysql -u $ADMIN_USERNAME -p $ADMIN_PASSWORD -db $DATABASE -host $HOST:$PORT -o docs -dp $CONNECTOR_J -hq -norows