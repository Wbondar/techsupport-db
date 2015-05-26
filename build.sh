#!/bin/sh

source domains.conf
source credentials.conf
TEMPLATE='/tmp/$USERmysqltemplate.txt'

touch $TEMPLATE

echo 'START TRANSACTION;' >> $TEMPLATE
cat users/* sequences/* tables/* triggers/* views/* routines/* permissions/* >> $TEMPLATE
echo 'COMMIT;' >> $TEMPLATE

eval "echo \"$(< $TEMPLATE)\"" > baseline.sql

rm $TEMPLATE