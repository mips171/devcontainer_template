#!/bin/bash

# This command is the last of three that finalizes container setup when a dev container is created.
# Runs after updateContentCommand and after the dev container has been assigned to a user for the first time.
# You can use this to install software specific to the container user.

# Read more https://containers.dev/implementors/json_reference/#lifecycle-scripts
echo "Running post-create shell script"

GIT_EMAIL="nicholas@nbembedded.com"
GIT_USERNAME="Nicholas Smith"

# Setup git
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
git config --global init.defaultBranch main

# Setup aliases
echo "alias buildall='/workspace/buildbot/buildall.sh'" >> ~/.bashrc

# Pull the code
echo "Cloning and setting up OpenWrt repository and scripts"
git clone git@github.com:mips171/buildbot.git \
&& git clone https://github.com/openwrt/openwrt.git \
&& cd openwrt \
&& ./scripts/feeds update -a && ./scripts/feeds install -a