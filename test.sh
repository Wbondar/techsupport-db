#!/bin/sh

#Import settings here in order to free test cases from burden locating them afterwards.
source *.conf

for TEST_CASE_DIRECTORY in `ls -d tests/*`
do
    echo 'Executing test case located at '$TEST_CASE_DIRECTORY
    . $TEST_CASE_DIRECTORY/before.sh
    . $TEST_CASE_DIRECTORY/run.sh
    . $TEST_CASE_DIRECTORY/after.sh
done
