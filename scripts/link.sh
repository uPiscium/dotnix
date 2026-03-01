#!/usr/bin/env sh
# Create symbolic links for dotfiles
# Usage: ./link.sh
# Author: upiscium

# Directory of dotfiles to link
DOTFILES_DIR="$HOME/dotnix/config.d"

# リスク管理: ディレクトリが存在しない場合のフェイルセーフ
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: Directory '$DOTFILES_DIR' does not exist." >&2
    exit 1
fi

# findコマンドを使用して、隠しファイルを含むすべての直下のファイル/ディレクトリを取得
# IFSとreadを用いて空白を含むパスにも堅牢に対応
find "$DOTFILES_DIR" -mindepth 1 -maxdepth 1 | while IFS= read -r file; do
    # Get the base name of the file/directory
    base_name="$(basename "$file")"
    target="$HOME/$base_name"

    # Check if the target already exists and is not a symbolic link
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Warning: $target already exists and is not a symbolic link. Skipping $file."
        continue
    fi

    # Create a symbolic link in the home directory
    ln -sf "$file" "$target"
    echo "Linked $file to $target"
done
