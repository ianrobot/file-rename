#!/bin/bash

set -ex

FILE_EXT=ext
NUM_FILES=$1
TEST_DIR="${2:-TEST-FILES}"

if [ ! -d "${TEST_DIR}" ]; then
  mkdir "${TEST_DIR}"
fi
cd "$TEST_DIR"

# https://stackoverflow.com/questions/32484504/using-random-to-generate-a-random-string-in-bash
function rand-str {
    # Return random alpha-numeric string of given LENGTH
    #
    # Usage: VALUE=$(rand-str $LENGTH)
    #    or: VALUE=$(rand-str)

    local DEFAULT_LENGTH=64
    local LENGTH=${1:-$DEFAULT_LENGTH}

    LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c "$LENGTH"
    # LC_ALL=C: required for Mac OS X - https://unix.stackexchange.com/a/363194/403075
    # -dc: delete complementary set == delete all except given set
}

# shellcheck disable=SC2034
for (( i = 1; i <= "${NUM_FILES}"; i++ )); do
  touch "$(rand-str 10)".$FILE_EXT
done
