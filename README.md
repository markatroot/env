# env

My personal Linux setup (Arch + niri): bash config, helper scripts, and wallpapers.

## Layout

```
bin/          helper scripts (added to PATH)
install.sh    links dotfiles into $HOME
dotfiles/
  bashrc      symlinked to ~/.bashrc — sources markrc
  markrc      main bash entry point — sources everything below
  inputrc     readline vi-mode bindings
  rc/         aliasrc, pathrc, variablesrc, themerc, functionrc, privaterc
  scripts/    sourced on shell start (e.g. bash completions)
pictures/     misc images
wallpaper/    wallpapers
```

## Install

Paths are hardcoded to `~/env`, so clone it there:

```bash
git clone <repo-url> ~/env
~/env/install.sh   # symlinks ~/.bashrc -> dotfiles/bashrc (backs up the old one)
```

Create `dotfiles/rc/privaterc` (git-ignored) for tokens and other secrets:

```bash
#!/bin/bash
export FW_TOKEN=""
export MY_GIT_TOKEN=""
```

`markrc` sources it on every shell start, so it must exist.

## Scripts

| Script  | What it does                                                    |
| ------- | --------------------------------------------------------------- |
| `bctl`  | Bluetooth shortcut: `bctl devices`, `bctl connect <name>`, `bctl disconnect <name>` |
| `fw`    | Work project helper: `fw cd <root\|site\|api\|...>`, `fw vim <project>`, `fw run <project>` |
| `diff.sh` | Opens a file side-by-side with its counterpart in the Next project (`nvim -d`) |
| `start` | Launches `niri-session`                                         |

## Not in this repo

Ignored via `.gitignore`: `config/` (app configs), `fonts/`, `lsp/` (debugger/LSP binaries), `notes/`, `Documents/`, `task_reports/`, and `dotfiles/rc/privaterc`.

## Dependencies

`nvim`, `foot`, `niri`, `bluetoothctl`, `yazi`, `wf-recorder` + `slurp`, `fzf`, `dotnet`, `node`/`npm`.
