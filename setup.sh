#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}"

PACKAGES=("antigravity" "vim" "tmux" "nvim" "vscode")

echo "==> Setting up dotfiles from: ${DOTFILES_DIR}"
echo "==> Target directory: ${TARGET_DIR}"

if command -v stow >/dev/null 2>&1; then
    echo "==> GNU Stow detected. Linking packages with stow..."
    for pkg in "${PACKAGES[@]}"; do
        if [ -d "${DOTFILES_DIR}/${pkg}" ]; then
            echo "    -> Stowing ${pkg}"
            stow -v -R -t "${TARGET_DIR}" -d "${DOTFILES_DIR}" "${pkg}"
        fi
    done
    echo "==> All packages stowed successfully!"
else
    echo "==> GNU Stow not found. Falling back to direct symlinks..."

    # Ensure parent directories exist
    mkdir -p "${TARGET_DIR}/.config"
    mkdir -p "${TARGET_DIR}/.config/Code/User"
    mkdir -p "${TARGET_DIR}/.gemini/config"

    # Vim & Tmux
    ln -sfn "${DOTFILES_DIR}/vim/.vimrc" "${TARGET_DIR}/.vimrc"
    echo "    -> Linked .vimrc"

    ln -sfn "${DOTFILES_DIR}/tmux/.tmux.conf" "${TARGET_DIR}/.tmux.conf"
    echo "    -> Linked .tmux.conf"

    # Neovim
    ln -sfn "${DOTFILES_DIR}/nvim/.config/nvim" "${TARGET_DIR}/.config/nvim"
    echo "    -> Linked .config/nvim"

    # VS Code
    if [ -f "${DOTFILES_DIR}/vscode/.config/Code/User/settings.json" ]; then
        ln -sfn "${DOTFILES_DIR}/vscode/.config/Code/User/settings.json" "${TARGET_DIR}/.config/Code/User/settings.json"
        echo "    -> Linked VS Code settings.json"
    fi

    # Antigravity Skills
    ln -sfn "${DOTFILES_DIR}/antigravity/.gemini/config/skills" "${TARGET_DIR}/.gemini/config/skills"
    echo "    -> Linked Antigravity skills"

    echo "==> All symlinks created successfully!"
fi
