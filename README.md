# Jack's Dotfiles

Personal shell/editor/tmux config managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Recommended: fork this repo first

If you plan to use this long-term, fork it so you can:

- keep your own changes
- sync upstream updates when you want

## Install GNU Stow

Install Stow before linking dotfiles.

### macOS (Homebrew)

```bash
brew install stow
```

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install -y stow
```

### Fedora

```bash
sudo dnf install -y stow
```

### Arch

```bash
sudo pacman -S stow
```

## Use these dotfiles with Stow

This repo includes a `.stowrc` with:

- `--target=~` (link into your home directory)
- ignore rules for `.stowrc` and `DS_STORE`

So from the repo root, you can just run:

```bash
stow .
```

Or use the helper script:

```bash
./setup.sh
```

### First-time setup

```bash
# 1) Clone your fork
git clone <your-fork-url> ~/dotfiles

# 2) Enter repo
cd ~/dotfiles

# 3) Symlink files into $HOME
stow .
```

## Add additional dotfiles

1. Add the file/folder inside this repo using the same path you want under `$HOME`.
2. Re-run `stow .`.
3. Commit and push to your fork.

Examples:

```bash
# add a new shell config
touch ~/dotfiles/.zshrc

# add a Neovim config path
mkdir -p ~/dotfiles/.config/nvim
touch ~/dotfiles/.config/nvim/init.lua

# relink everything
cd ~/dotfiles && stow .
```

## Updating links after changes

Run this any time you add/move files in the repo:

```bash
stow -R .
```

## Unlink / remove managed symlinks

```bash
stow -D .
```

## Conflict notes

If Stow reports conflicts, you likely already have a real file at that destination in `$HOME`.

- back up existing file(s)
- remove or rename conflicting file(s)
- run `stow .` again
