#!/bin/bash
# thanks c0dine lol

rm -rf */.theos
rm -rf */packages
git add .

echo "Please put your commit message below"
read -p ">>> " MESSAGE
NEWMESSAGE="$(echo $MESSAGE)"
git commit -m "$NEWMESSAGE"
git push