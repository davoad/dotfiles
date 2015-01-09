#!/usr/bin/env bash
function new-tmux-from-dir-name {
  tmux -2 new-session -As `basename $PWD`
}
