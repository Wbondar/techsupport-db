#!/bin/sh
cat after.sql
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD --host=$HOST < after.sql >> test.log $DATABASE
cat test.log