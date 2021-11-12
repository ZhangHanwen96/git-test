#! /bin/bash

# git checkout -b test2 master

# git touch t.txt
# echo "ssss" > t.txt

# git add . && git commit -m 'cmmit file' && git push origin test2

# gh pr create --head test2 --base master --fill

# git fetch upstream

if [ -z "${1}" ]; then
  echo "Name of new branch?"
  read branch

  br = "upgrade/$branch"

  git checkout -b $br
  yarn install @aftership/uikit-admin-polaris-extends@latest
  git add . && git commit -m 'upgrade-polaris-sdk' && git push origin $br

  gh pr create --head $br --base master --fill

  else
    echo "?"
fi