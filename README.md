# Dotfiles

Personal dotfiles and development environment configurations organized as modular packages compatible with [GNU Stow](https://www.gnu.org/software/stow/).

## Package Structure

```text
dotfiles/
├── antigravity/
│   └── .gemini/config/skills/
│       └── clone-my-repo/
│           └── SKILL.md          # Global Antigravity skill
├── vim/
│   └── .vimrc                   # Vim configuration
├── tmux/
│   └── .tmux.conf               # Tmux configuration
├── nvim/
│   └── .config/nvim/            # Neovim configuration
├── vscode/
│   └── .config/Code/User/       # VS Code settings
├── setup.sh                     # Automated bootstrap script
└── README.md
```

---

## Setup on a New Machine

Clone the repository to `~/My-Work/dotfiles`:

```bash
git clone git@github.com:rasyidcode/dotfiles.git ~/My-Work/dotfiles
cd ~/My-Work/dotfiles
```

### Option 1: Automated Script (Recommended)

Run the included setup script. It automatically uses GNU Stow if available, or falls back to direct symlinks:

```bash
./setup.sh
```

### Option 2: Using GNU Stow Manually

If GNU Stow is installed (`sudo apt install stow`):

```bash
# Stow all packages to $HOME
stow -v -R -t ~ antigravity vim tmux nvim vscode
```

Or stow individual packages:

```bash
stow -v -t ~ vim
stow -v -t ~ tmux
stow -v -t ~ antigravity
```

### Option 3: Manual Symlinks

```bash
mkdir -p ~/.config ~/.config/Code/User ~/.gemini/config

ln -sfn ~/My-Work/dotfiles/vim/.vimrc ~/.vimrc
ln -sfn ~/My-Work/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sfn ~/My-Work/dotfiles/nvim/.config/nvim ~/.config/nvim
ln -sfn ~/My-Work/dotfiles/vscode/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -sfn ~/My-Work/dotfiles/antigravity/.gemini/config/skills ~/.gemini/config/skills
```
