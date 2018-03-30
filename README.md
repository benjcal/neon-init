# neon-init

Simple script to add neon rust bindings to an existing node app

## Installation

`curl https://raw.githubusercontent.com/benjcal/neon-init/master/neon-init.sh -s | sh`

**warning**:
Right now the script is a little aggresive without asking, it creates `native/` on the root
of the application and modifies `package.json` to add an entry for `npm run node-build`

## Usage

Your Rust code is at `native/src/lib.rs`

Read the documentation [here](https://api.neon-bindings.com/neon/index.html).

Sample JS file:
```js
var addon = require('./native')

console.log(addon.hello())
```

Enjoy!
