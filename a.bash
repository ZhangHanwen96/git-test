#! /bin/bash

git checkout -b test2 master

git touch t.txt
echo "ssss" > t.txt

git add . && git commit -m 'cmmit file' && git push origin test2

gh pr create --head test2 --base master --fill