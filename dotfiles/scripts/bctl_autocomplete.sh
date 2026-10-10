#!/usr/bin/env bash

_bctl_complete() {
  local cur
  cur="${COMP_WORDS[COMP_CWORD]}"

  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=( $(compgen -W "connect disconnect" -- "$cur") )
    return
  fi

  if [[ $COMP_CWORD -eq 2 && "${COMP_WORDS[1]}" == "connect" ]]; then
    local devices=()
    mapfile -t devices < <(
      bluetoothctl devices | awk '{$1=$2=""; sub(/^ +/, ""); print}'
    )

    COMPREPLY=()
    for d in "${devices[@]}"; do
      [[ "$d" == "$cur"* ]] && COMPREPLY+=("$d")
    done
    return
  fi
}

complete -F _bctl_complete bctl
