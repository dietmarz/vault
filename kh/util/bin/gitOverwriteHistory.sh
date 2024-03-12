#!/bin/bash

set -eu

# FILE_PATH="$1"
#
# cp "$FILE_PATH" "/tmp/file_to_replace_in_git_history"
#
# FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --tree-filter "
#     cp '/tmp/file_to_replace_in_git_history' '$FILE_PATH'
# " --tag-name-filter cat -- --all
#
# rm "/tmp/file_to_replace_in_git_history"



# https://stackoverflow.com/questions/78140146/git-replace-file-content-in-history
# https://htmlpreview.github.io/?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html#EXAMPLES
SRC_FILE="$1"
TO_REPLACE_PATH="$1"

git filter-repo --force --commit-callback "for change in commit.file_changes:
    if (change.type != b'D' and change.filename == b'${TO_REPLACE_PATH}'):
        change.blob_id = b'$(git hash-object -w ${SRC_FILE})'"
