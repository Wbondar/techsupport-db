#!/bin/sh

source domains.conf
source credentials.conf
TEMPLATE='/tmp/$USERmysqltemplate.txt'

touch $TEMPLATE

echo 'START TRANSACTION;' >> $TEMPLATE
cat tables/* sequences/* triggers/* views/* routines/* >> $TEMPLATE
echo 'COMMIT;' >> $TEMPLATE

BASELINE=baseline.sql
chmod 644 $BASELINE
eval "echo \"$(< $TEMPLATE)\"" > $BASELINE
chmod 444 $BASELINE

rm $TEMPLATE