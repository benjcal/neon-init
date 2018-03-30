# neon-init

Simple script to add neon rust bindings to an existing node app

## Usage

`curl https://raw.githubusercontent.com/benjcal/neon-init/master/neon-init.sh -s | sh`

**warning**

Right now the script is a little aggresive, it makes `native/` on the root
of the application and modifies `package.json` to add an entry for `npm run node-build`

Enjoy!