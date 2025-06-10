#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="${SCRIPT_DIR}"
HOME_DIR="${HOME}"

function create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -L "$target" ]; then
        echo "Symlink already exists: $target"
    elif [ -e "$target" ]; then
        echo "File already exists (not a symlink): $target"
        echo "Please backup and remove it manually if you want to create a symlink"
    else
        ln -s "$source" "$target"
        echo "Created symlink: $target -> $source"
    fi
}

function get_target_name() {
    local dot_name="$1"
    # Convert dot_xxx to .xxx
    echo "${dot_name/dot_/.}"
}

function process_file() {
    local source_path="$1"
    local filename="$(basename "$source_path")"
    local target_name="$(get_target_name "$filename")"
    local target_path="${HOME_DIR}/${target_name}"
    
    create_symlink "$source_path" "$target_path"
}

function process_directory() {
    local source_path="$1"
    local dirname="$(basename "$source_path")"
    local target_name="$(get_target_name "$dirname")"
    local target_path="${HOME_DIR}/${target_name}"
    
    # Create parent directory if needed
    local parent_dir="$(dirname "$target_path")"
    if [ ! -d "$parent_dir" ]; then
        mkdir -p "$parent_dir"
        echo "Created parent directory: $parent_dir"
    fi
    
    create_symlink "$source_path" "$target_path"
}

function main() {
    echo "Installing dotfiles..."
    echo "Source directory: $DOTFILES_DIR"
    echo "Target directory: $HOME_DIR"
    echo
    
    # Auto-discover all dot_* files and directories
    echo "Scanning for dot_* files..."
    
    # Process files
    while IFS= read -r file; do
        if [ -f "$file" ]; then
            process_file "$file"
        fi
    done < <(find "$DOTFILES_DIR" -maxdepth 1 -name "dot_*" -type f)
    
    echo
    
    # Process directories
    # echo "Scanning for dot_* directories..."
    # while IFS= read -r -d '' dir; do
    #     if [ -d "$dir" ]; then
    #         process_directory "$dir"
    #     fi
    # done < <(find "$DOTFILES_DIR" -maxdepth 1 -name "dot_*" -type d -print0)
    
    echo
    echo "Installation complete!"
    echo "Tip: Run this script again anytime to create symlinks for newly added dot_* files."
}

main "$@"
