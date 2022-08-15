#!/usr/bin/env bash

# kubeval
KUBEVAL_VERSION="v0.16.1"
(curl -sSL https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz | sudo tar -C /usr/local/bin -xz kubeval)
