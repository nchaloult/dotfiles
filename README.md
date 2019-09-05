# Nick's Dotfiles & Configs

If/when I'm working on a new Mac, or a Mac that isn't mine, I can quickly clone this repo and experience the comfort of familiar configs thanks to the power of symlinks 😎

## Setting Up

To get everything wired up:

1. `cd ~`
1. `git clone https://github.com/nchaloult/dotfiles.git`
1. `./sendit.sh`
1. ???
1. Profit

## Note Concerning iTerm Color Scheme

I've included [gruvbox.itermcolors](colors/gruvbox.itermcolors), which stores colors for the [gruvbox](https://github.com/morhetz/gruvbox) color scheme. The [sendit.sh](sendit.sh) installer script wires up an iTerm `.plist` file, which should capture this color scheme, but if it doesn't for some reason, then you can load it in manually with that provided file.
