#!/bin/bash
# thanks c0dine lol

echo "Starting commit."

rm -rf */.theos
rm -rf */packages
git add .

echo "Please put your commit message below"
read -p ">>> " MESSAGE

if [[ $MESSAGE == "exit()" ]]; then {
    echo -e "Script was told to exit."
    exit;
} else {
    NEWMESSAGE="$(echo $MESSAGE)"
    git commit -m "$NEWMESSAGE"
    git push
}
fi