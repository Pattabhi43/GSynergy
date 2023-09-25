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
