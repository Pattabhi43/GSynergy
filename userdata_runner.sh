#!/bin/bash

sudo apt-get update -y
sudo apt-get install git -y
sudo apt-get install python -y
sudo apt-get install gzip -y

#Postgres
sudo apt-get install postgresql postgresql-contrib -y
sudo systemctl start postgresql
sudo systemctl start postgresql

#Setting user pasword
sudo -i -u postgres
psql
ALTER USER postgres PASSWORD 'Gsynergy';
CREATE USER Gsynergy WITH PASSWORD 'Gsynergy';

#Github runner
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.309.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz
echo "2974243bab2a282349ac833475d241d5273605d3628f0685bd07fb5530f9bb1a  actions-runner-linux-x64-2.309.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.309.0.tar.gz

./config.sh --url https://github.com/Pattabhi43/GSynergy --token A44LCUFJKGLLPVPDTUND5XDFCH2HS
./run.sh