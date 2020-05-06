#!/usr/bin/env bash

# This script is here because Quke does not return an exit code
# other than zero, which means that in Jenkins the job is deemded
# successful even if the tests fail.
#
# Therefore Jenkins is set up to redirect the Quke output to
# a file (test-results.txt) and then this script runs to
# look for a known pattern which would indicate that the tests
# have failed.
#
# Success has text like: 5 scenarios (5 passed)
# Failure has text like: 1 scenario (1 failed)

tests_failed=$(grep -c scenario.*failed test-results.txt)

echo "Result is $tests_failed"

if [ "$tests_failed" -eq "0" ];
then
  echo "Tests all passed"
else
  echo "Tests have failed"
  exit 1;
fi
