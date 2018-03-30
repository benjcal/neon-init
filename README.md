# neon-init

Simple script to add neon rust bindings to an existing node app

## Installation

`curl https://raw.githubusercontent.com/benjcal/neon-init/master/neon-init.sh -s | sh`

**warning**:
Right now the script is a little aggresive, it creates `native/` on the root
of the application and modifies `package.json` without asking.

## Usage

The Rust source code is at `native/src/lib.rs`

Run `npm run neon-build` to compile the Rust scource code

Sample JS file:
```js
const addon = require('./native')

console.log(addon.hello())
```

The script is simple and there's not a lot of things that can go wrong, but still use this under your own responsability and always `git commit` before!

### Enjoy! 😃

[Neon Documentation](https://api.neon-bindings.com/neon)

[Rust Documentation](https://doc.rust-lang.org)

[Node Documentation](https://nodejs.org/api)
