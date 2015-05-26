#!/bin/sh

source domains.conf
source credentials.conf
TEMPLATE='/tmp/$USERmysqltemplate.txt'

cat users/* tables/* triggers/* views/* permissions/* > $TEMPLATE

eval "echo \"$(< $TEMPLATE)\"" > baseline.sql

rm $TEMPLATE