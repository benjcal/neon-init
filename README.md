# neon-init

Simple script to add neon rust bindings to an existing node app

## Installation

`curl https://raw.githubusercontent.com/benjcal/neon-init/master/neon-init.sh -s | sh`

**warning**:
Right now the script is a little aggresive, it creates `native/` on the root
of the application and modifies `package.json` without asking.

## Usage

Your Rust source code is at `native/src/lib.rs`

Run `npm run neon-build` to compile Rust scource code

Sample JS file:
```js
var addon = require('./native')

console.log(addon.hello())
```

### Enjoy! 😃

[Neon Documentation](https://api.neon-bindings.com/neon)

[Rust Documentation](https://doc.rust-lang.org)

[Node Documentation](https://nodejs.org/api)
