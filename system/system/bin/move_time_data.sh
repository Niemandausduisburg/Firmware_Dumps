#!/system/bin/sh

# Copyright (c) 2018 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.

DEST_PATH="/data/vendor/time"
FILES_MOVED="/data/vendor/time/moved"
SRC_PATH="/data/time"
ATS_CHECK="/data/vendor/time/ats_1"

if [ ! -f "$FILES_MOVED" ]; then
  if [ ! -f "$ATS_CHECK" ]; then
    for i in "$SRC_PATH/ats"*; do
      dest_path=$DEST_PATH/"${i#$SRC_PATH/}"
      cp $i "$dest_path"
    done
    restorecon -R "$DEST_PATH"
  fi
  echo 1 > "$FILES_MOVED"
fi
