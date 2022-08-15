#!/usr/bin/env bash

# kubeval
KUBEVAL_VERSION="v0.16.1"
wget https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
sudo mv kubeval /usr/local/bin
