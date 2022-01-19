#!/bin/bash
success(){
 local CMD="$1"
 echo "Success ${CMD}"
}
failure(){
 local CMD="$1"
 echo "Success ${CMD}"
}
chmod_do(){
 local FPATH="$1"
 local PERM="$2"
 local CMD="sudo chmod ${PERM} ${FPATH}"
 echo "$CMD"
 sh -c "$CMD" && \
  success "$CMD" || \
  failure "$CMD"
}
chmod_all(){
 # Set permissions 0440 to /etc/sudoers.d/*
 local SD_PATH="$1"
 for i in `find ${SD_PATH} -type f` ; do
 chmod_do "${i}" "0440"
done
}
chmod_all "/etc/sudoers.d/*"
