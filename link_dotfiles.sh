#!/bin/bash

# Directory where your dotfiles are located
dotfiles_dir="$HOME/dotfiles"

# List of dotfiles to link
dotfiles=( 
  "git/.gitconfig"
  "vim/.vimrc"
)

# Create symbolic links
for file in "${dotfiles[@]}"; do
  filename="$(basename "$file")"
  source_path="$dotfiles_dir/$file"
  target_path="$HOME/$filename"

  # Remove existing file or folder
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    echo "Removing existing $target_path"
    rm -rf "$target_path"
  fi

  ln -sf "$source_path" "$target_path"
  echo "Linked $filename"
done

echo "All dotfiles linked!"
