#!/bin/bash

cd "$(dirname "$0")"

# SharedDomain
cd ../RocketLaunch/DomainLayer/SharedDomain
swift package --allow-writing-to-package-directory sourcery-command
cd ../..
