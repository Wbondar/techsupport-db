#!/bin/sh
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD --host=$HOST < test.sql >> test.log $DATABASE