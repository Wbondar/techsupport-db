#!/bin/sh

#Import settings here in order to free test cases from burden locating them afterwards.
source credentials.conf

for TEST_CASE_DIRECTORY in `ls -d tests/*`
do
    echo 'Executing test case located at '$TEST_CASE_DIRECTORY
    cd $TEST_CASE_DIRECTORY
    source before.sh
    source run.sh
    source after.sh
    cd ..
    cd ..
done
