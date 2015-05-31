#!/bin/sh

source domains.conf
source credentials.conf
TEMPLATE='/tmp/$USERmysqltemplate.txt'

touch $TEMPLATE

echo 'START TRANSACTION;' >> $TEMPLATE
cat users/* sequences/* tables/* triggers/* views/* routines/* permissions/* >> $TEMPLATE
echo 'COMMIT;' >> $TEMPLATE

BASELINE=baseline.sql
chmod 644 $BASELINE
eval "echo \"$(< $TEMPLATE)\"" > $BASELINE
chmod 444 $BASELINE

rm $TEMPLATE