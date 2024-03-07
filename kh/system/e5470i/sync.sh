#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cp    /home/dietmar/.gitconfig    ${SCRIPT_DIR}/home/dietmar/
cp    /home/dietmar/.bashrc       ${SCRIPT_DIR}/home/dietmar/
cp    /home/dietmar/.bash_aliases ${SCRIPT_DIR}/home/dietmar/
cp -r /home/dietmar/.aws          ${SCRIPT_DIR}/home/dietmar/
cp    /etc/fstab                  ${SCRIPT_DIR}/etc
