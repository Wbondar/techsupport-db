source credentials.conf

git checkout gh-pages
java -jar schemaSpy_5.0.0.jar -t mysql -u $ADMIN_USERNAME -p $ADMIN_PASSWORD -db $DATABASE -host $HOST:$PORT -o . -dp $CONNECTOR_J -hq -norows
git add *
git commit -a -m "$1"
git push -u hub gh-pages:gh-pages
git checkout master