#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

## Install Node.js, yarn (also needed for Rails asset compilation)
minimal_apt_get_install -y nodejs yarn
if [[ ! -e /usr/bin/node ]]; then
	ln -s /usr/bin/nodejs /usr/bin/node
fi

## Update npm
npm install -g npm