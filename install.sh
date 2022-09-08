#!/usr/bin/env bash

PACKAGES=(
    zsh
    tmux
)

for PKG in ${PACKAGES[@]}; do
    CONFLICTS=$(stow --no --verbose $PKG 2>&1 | awk '/\* existing target is/ {print $NF}')
    for filename in ${CONFLICTS[@]}; do
        TARGETFILE=$HOME/$filename 
        if [[ -f $TARGETFILE || -L $TARGETFILE ]]; then
            TIMESTAMP=$(date +%Y%m%d_%H%M%S)
            BACKUPFILE="$TARGETFILE"_backup_"$TIMESTAMP"
            echo "Moving $TARGETFILE to $BACKUPFILE"
            mv $TARGETFILE $BACKUPFILE
        fi
    done

    stow --verbose -R $PKG
done
