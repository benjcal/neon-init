# neon-init

Simple script to add neon rust bindings to an existing node app

## Usage

`curl https://benjcal.github.io/neon-init/neon-init.sh | sh`

**warning**

Right now the script is a little aggresive, it makes `native/` on the root
of the application and modifies `package.json` to add an entry for `npm run node-build`

Enjoy!