#!/bin/sh

# make "native" folder
if [ -d native ]
then
    echo "Error: 'native' folder exist"
    exit 1
fi

mkdir -p native/src

# download template files
curl -o native/Cargo.toml https://raw.githubusercontent.com/benjcal/neon-init/master/templates/Cargo.toml
curl -o native/build.rs https://raw.githubusercontent.com/benjcal/neon-init/master/templates/build.rs
curl -o native/src/lib.rs https://raw.githubusercontent.com/benjcal/neon-init/master/templates/src/lib.rs

if [ -f package.json ]
then
    echo "package.json not found"
    echo "generate one using 'npm init'"
    exit 1
fi

npm install neon-cli

# add neon-build to package.json
node -e "const fs = require('fs'); \
let p = fs.readFileSync('package.json', 'utf8'); \
let pp = JSON.parse(p); \
Object.assign(pp.scripts, {'neon-build': 'neon build'}); \
fs.writeFileSync('package.json~', p); \
fs.writeFileSync('package.json', JSON.stringify(pp, null, 2));"
