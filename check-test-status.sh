#!/usr/bin/env bash

tests_failed=$(grep -c scenario.*failed test-results.txt)

echo "Result is $tests_failed"

if [ "$tests_failed" -eq "0" ];
then
  echo "Tests all passed"
else
  echo "Tests have failed"
  exit 1;
fi
