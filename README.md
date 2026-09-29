# Dotfiles

Personal dotfiles and development environment configurations.

## Repository Structure

* `.vimrc` - Vim configuration
* `.tmux.conf` - Tmux configuration
* `nvim/` - Neovim configuration
* `vscode/` - Visual Studio Code settings & keybindings
* `.gemini/config/skills/` - Global Antigravity agent skills (e.g., `clone-my-repo`)

---

## Setup on a New Machine

Clone the repository to `~/My-Work/dotfiles`:

```bash
git clone git@github.com:rasyidcode/dotfiles.git ~/My-Work/dotfiles
cd ~/My-Work/dotfiles
```

### Option A: Using GNU Stow (Recommended)

If GNU Stow is installed (`sudo apt install stow`):

```bash
# Mass-symlink all configurations to $HOME
stow -v -t ~ .
```

### Option B: Manual Symlinks

```bash
# Vim & Tmux
ln -sfn ~/My-Work/dotfiles/.vimrc ~/.vimrc
ln -sfn ~/My-Work/dotfiles/.tmux.conf ~/.tmux.conf

# Neovim
mkdir -p ~/.config/nvim
ln -sfn ~/My-Work/dotfiles/nvim/* ~/.config/nvim/

# Antigravity Skills
mkdir -p ~/.gemini/config
ln -sfn ~/My-Work/dotfiles/.gemini/config/skills ~/.gemini/config/skills
```
