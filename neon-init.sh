#!/bin/sh

# make "native" folder
if [ -d native ]
then
    echo "native folder exist"
    exit 1
fi

mkdir -p native/src

# download template files
# needs to be changed for curl -o later...
cp templates/Cargo.toml native/
cp templates/build.rs native/
cp templates/lib.rs native/src/

NAME=$(git show --format="%an <%ae>" |head -n 1)

if [ -z $(echo $NAME | grep "fatal") ]
then
    echo "error with git"
    NAME=$USER
fi

sed -i ".toml" "s/\"name\"/\"$NAME\"/g" native/Cargo

npm install neon-cli

# add neon-build to package.json
node -e "const fs = require('fs'); \
let p = fs.readFileSync('package.json', 'utf8'); \
let pp = JSON.parse(p); \
Object.assign(pp.scripts, {'neon-build': 'neon build'}); \
fs.writeFileSync('package.json~', p); \
fs.writeFileSync('package.json', JSON.stringify(pp, null, 2));"

