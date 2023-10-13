# Nick's Neovim Dotfiles

## Initial setup

If you'd like to use these configs on your machine, wire everything up by running the `setup.sh` script.

    $ ./setup.sh

### A note about warning messages

This script is a little sketch, but it still works! You'll see some warning messages when you run it. You should be able to safely ignore them.

They appear because plugins are installed in the `init.vim` file's `PackInit()` function, yet plugin configuration lives outside of that function, so those configs are parsed for the first time before any plugins are installed.

This especially concerns things like color schemes. A warning message will say something like `<color scheme> cannot be found`, yet the next time you launch Neovim, it'll be applied.

There's probably some clever way to just call the `PackInit()` function, and avoid parsing the rest of the config. But this works, and you'll really only ever run this once anyway, so it's good enough for me! :)
