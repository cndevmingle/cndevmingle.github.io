#!/bin/bash
find ../ -name ".DS_Store" -depth -exec rm {} \;

# for file in `ls ../projects`
#     do
#       if [[ -d "../projects/$file" ]]; then
#         mkdir -p "./debs/$file"
#         dpkg-deb -bZgzip "../projects/$file" "./debs/$file"
# 			fi
#     done

sudo dpkg-scanpackages -m ./debs > ./Packages
bzip2 -fks ./Packages

git add .
git commit -m "update cydia repo"
git push
