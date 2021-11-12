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

  br="upgrade/${branch}"

  if git show-ref --quiet refs/heads/upgrade/$br; then
    echo "!!Branch named ~${br}~ already exists, are you sure to delete?"
    read -p "Yes(y) or No(n) ?" yn
    [$yn == "y"] &&  git branch -d $br
    if [$yn == "n"]; then
        echo "Enter another name for new branch: $"
        read rBranch

        br="upgrade/${rBranch}"
    fi
  fi

  

  git checkout -b $br
  yarn add @aftership/uikit-admin-polaris-extends@latest
  git add . && git commit -m 'upgrade-polaris-sdk' && git push -f origin $br

  gh pr create --head $br --base master --fill

  else
    echo "?"
fi

