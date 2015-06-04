#!/bin/sh
source test.conf
cat party_create.sql
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD --host=$HOST < party_create.sql >> test.log $DATABASE
cat user_connect.sql
mysql --user=$DATABASE_USER_PREFIX$TEST_PARTY_NAME --password=$TEST_PARTY_PASSWORD < user_connect.sql >> test.log $DATABASE