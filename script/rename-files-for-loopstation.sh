#!/bin/bash

set -ex

# check args
#if [ ! -d "${1}" ]; then
#  printf "usage: %s [AUDIO_FILES_DIR] [TARGET_DIR]\n\n" "${0}"
#  printf "AUDIO_FILES_DIR is the directory where the audio files reside."
#  printf "TARGET_DIR is opional and is a directory where the renamed files are copied to. If it not exists it will be created."
# fi


SOURCE_DIR=${1:-'.'}
TARGET_DIR=${2:-"Renamed Files"}


# TODO check files
i=1
# read file list before creating target dir to avoid recursion
FILES=$(ls "${SOURCE_DIR}")
[[ -d "${TARGET_DIR}" ]] ||  mkdir "${TARGET_DIR}"

for file in $FILES; do
  #
  NEW_FILE="${TARGET_DIR}"/$(echo "${file}" | sed -E "s/[^\.]*\.(.+)/${i}.\1/g")
  TARGET_FILES="${TARGET_FILES} ${NEW_FILE}"
  cp "${SOURCE_DIR}/${file}" "${NEW_FILE}"
  (( i++ ))
done

# TODO Verify content is the same
#for source_file in ${FILES}; do
#  MD5_SOURCE=$(md5sum ${source_file})
  
#done
