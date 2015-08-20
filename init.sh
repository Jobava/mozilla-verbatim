#!/bin/bash
echo "Clean up zips..."
rm -rf zips
mkdir zips
INPUT=repos.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read reponame repourl
do
    if [[ -n "$reponame" && -n "$repourl" && $reponame != "reponame" && $repourl != "repourl" ]]; then
        echo "Creating $reponame ..."
        rm -rf "repos/$reponame" 
        mkdir -p "repos/$reponame"
        wget -O "repos/${reponame}/${reponame}.zip" "$repourl" 
        unzip "repos/${reponame}/${reponame}.zip" -d "repos/${reponame}"
        mv "repos/${reponame}/${reponame}.zip" "zips/${reponame}.zip"
    fi
done < $INPUT
IFS=$OLDIFS
echo "*~" > .gitignore
echo ".svn" >> .gitignore
echo ".git" >> .gitignore
echo "*#" >> .gitignore

