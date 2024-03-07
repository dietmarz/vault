#!/bin/bash
set -eu

echo "Create server-repo ##############################################################################################"
mkdir server-repo
cd server-repo
git init --bare

echo "Create client1-repo #############################################################################################"
cd ..
mkdir client1-repo
cd client1-repo
git clone ../server-repo .

echo "Client1 change1 and push ########################################################################################"
echo "Huhu von Dietmar" > sourcen.txt
git add sourcen.txt
git commit -m "Initial commit from client1"
git push origin master

echo "Create client2-repo #############################################################################################"
cd ..
mkdir client2-repo
cd client2-repo
git clone ../server-repo .

echo "Client1 change2 and push ########################################################################################"
cd ../client1-repo
echo "Eine neue Zeile von Client1" >> sourcen.txt
git add sourcen.txt
git commit -m "Update sourcen.txt von Client1"
git push origin master

echo "Client2 rebases #################################################################################################"
cd ../client2-repo
git fetch origin
git rebase origin/master

echo "Created: 2 clients , 1 server dir with one commit with one file"
