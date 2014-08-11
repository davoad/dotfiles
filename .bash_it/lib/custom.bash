#!/usr/bin/env bash
function new-tmux-from-dir-name {
  tmux new-session -As `basename $PWD`
}
