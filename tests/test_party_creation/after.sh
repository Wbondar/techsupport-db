#!/bin/sh
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD --host=$HOST < after.sql $DATABASE
cat test.log
rm test.log