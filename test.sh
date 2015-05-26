source credentials.conf

echo "Testing basic issue functionality. All SELECT statements are expected to return \"true\"."
mysql --user=$CLIENT_USERNAME --password=$CLIENT_PASSWORD < tests/test_basic_issue_functionality.sql > logs/test_basic_issue_functionality.log $DATABASE
cat logs/test_basic_issue_functionality.log

echo "Testing accessiblity of the core of the database schema to the user of name $CLIENT_USERNAME. All statements are expected to fail due to permission violation."
mysql --user=$CLIENT_USERNAME --password=$CLIENT_PASSWORD < tests/test_accessibility.sql > logs/test_accessibility.log $DATABASE
cat logs/test_accessibility.log

echo "Testing comment posting on issues."
mysql --user=$CLIENT_USERNAME --password=$CLIENT_PASSWORD < tests/test_commenting.sql > logs/test_commenting.log $DATABASE
cat logs/test_commenting.log
