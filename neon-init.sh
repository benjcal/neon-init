#!/bin/bash

if [ -e package.json ]
then
    echo "\n'package.json' found\n"
else
    echo "\nError: 'package.json' not found"
    echo "the script needs to be run on the root of the node.js project"
    exit 1
fi

# make "native" folder
if [ -d native ]
then
    echo "\nError: 'native' folder exist"
    exit 1
fi

echo -e "\n\e[32m\e[1mMaking directory...\n"
mkdir -p native/src

echo -e "\n\e[32m\e[1mDownloading files...\n"
# download template files
curl -o native/Cargo.toml https://raw.githubusercontent.com/benjcal/neon-init/master/templates/Cargo.toml
curl -o native/build.rs https://raw.githubusercontent.com/benjcal/neon-init/master/templates/build.rs
curl -o native/src/lib.rs https://raw.githubusercontent.com/benjcal/neon-init/master/templates/lib.rs

echo -e "\n\e[32m\e[1mInstalling npm packages...\n"
npm install neon-cli

echo -e "\n\e[32m\e[1mAdding build script to package.json...\n"
# add neon-build to package.json
node -e "const fs = require('fs'); \
let p = fs.readFileSync('package.json', 'utf8'); \
let pp = JSON.parse(p); \
Object.assign(pp.scripts, {'neon-build': 'neon build'}); \
fs.writeFileSync('package.json~', p); \
fs.writeFileSync('package.json', JSON.stringify(pp, null, 2));"

echo -e "\n\e[32m\e[1mHappy hacking!"