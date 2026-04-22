#!/usr/bin/env bash
# Link this repo's .papis/ config into the XDG config location so `papis`
# can be invoked from any working directory.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src="$repo_dir/.papis"
target="$HOME/.config/papis"

if [[ ! -d "$src" ]]; then
    echo "error: $src not found" >&2
    exit 1
fi

if [[ -L "$target" ]]; then
    current="$(readlink "$target")"
    if [[ "$current" == "$src" ]]; then
        echo "already linked: $target -> $src"
        exit 0
    fi
    echo "error: $target is a symlink pointing at $current; refusing to overwrite" >&2
    exit 1
fi

if [[ -e "$target" ]]; then
    echo "error: $target already exists and is not a symlink; back it up or remove it first" >&2
    exit 1
fi

mkdir -p "$(dirname "$target")"
ln -s "$src" "$target"
echo "linked $target -> $src"
