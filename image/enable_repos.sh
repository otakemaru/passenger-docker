#!/bin/bash
set -e
source /pd_build/buildconfig

header "Preparing APT repositories"

## Phusion Passenger
run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
if [[ "$PASSENGER_ENTERPRISE" ]]; then
	echo "+ Enabling Passenger Enterprise APT repo"
	echo deb https://download:$PASSENGER_ENTERPRISE_DOWNLOAD_TOKEN@www.phusionpassenger.com/enterprise_apt xenial main > /etc/apt/sources.list.d/passenger.list
else
	echo "+ Enabling Passenger APT repo"
	echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list
fi

## yarn
run curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

## Node.js
run curl -sL https://deb.nodesource.com/setup_6.x | bash -

run apt-get update
