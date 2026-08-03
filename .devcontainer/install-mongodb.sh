#!/bin/bash
set -e

if command -v mongod >/dev/null 2>&1; then
    echo "MongoDB already installed."
    exit 0
fi

sudo apt-get update

curl -fsSL https://pgp.mongodb.com/server-8.0.asc | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/mongodb-server-8.0.gpg >/dev/null

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | \
sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

sudo apt-get update

sudo apt-get install -y mongodb-org