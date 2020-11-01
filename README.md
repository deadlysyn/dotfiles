# dotfiles

Assorted [configuration files](http://dotfiles.github.io).

# Install

You'll need [GNU stow](https://www.gnu.org/software/stow), which
the install script uses to manage symlinks.

```console
# Linux
pacman -S stow

# Mac
brew install stow
```

Now change into the appropriate directory, and use the install script
to update links. The script is a simple stow wrapper which tries to
be paranoid. If configs already exist, you'll be warned and it will
bail (move existing configs out of the way and try again).

```console
cd linux
../install bspwm polybar sxhkd
```

# License

[MIT](http://opensource.org/licenses/MIT)

