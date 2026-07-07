# dotfiles

Cheat sheet for the commands and shortcuts defined in this repo.

## Shell aliases (`zshrc`)

| Command | Expands to |
|---|---|
| `t` | `terraform` |
| `tw` | `terraform workspace` |
| `vim` / `vi` | `nvim` |
| `login-aws` | `aws sso login` |

## Git worktree helpers (`zshrc`)

Worktrees are created as siblings of the current repo directory.

| Command | Action |
|---|---|
| `gw <name> <branch>` | Create a worktree at `../<name>` on new branch `<branch>` |
| `gwd <name>` | Remove the sibling worktree `../<name>` |
| `gwl` | List all worktrees |
| `gwm <old> <new>` | Rename a sibling worktree |

## Git aliases (`gitconfig`)

| Alias | Runs |
|---|---|
| `git co` | `checkout` |
| `git br` | `branch` |
| `git ci` | `commit` |
| `git st` | `status` |
| `git staged` | `diff --staged` |
| `git hist` | Pretty graph log |
| `git lb` | Recently checked-out branches (from reflog) |
| `git please` / `git push please` | `push --force-with-lease` |

Also configured: `rebase.autosquash = true`, `push.autoSetupRemote = true`, editor `nvim`.

## Node

`.nvmrc` in a directory triggers an automatic `nvm use` (installs if missing) on `cd`.

## tmux

Prefix is `Ctrl-a` (`^a`). Common bindings:

| Key | Action |
|---|---|
| `^a s` / `^a v` | Horizontal / vertical split (keeps cwd) |
| `^a h/j/k/l` | Move between panes |
| `^a <` `>` `-` `+` | Resize pane |
| `^a =` | Reset to tiled layout |
| `^a c` | New window (keeps cwd) |
| `^a N` | New window, prompt for name |
| `^a ^a` | Toggle last window |
| `^a L` | Choose session |
| `^a R` | Restore session (tmux-resurrect) |
| `^a Z` | Save session |
| `^a m` / `^a M` | Mouse on / off |
| `^a y` | Toggle synchronize-panes |
| `^a `` ` `` | Popup shell in current path |
| `^a r` | Reload tmux config |

## Neovim

Leader is `<Space>`. Full list in [`keybindings.md`](./keybindings.md).

### LSP — errors, types, definitions

| Key | Action |
|---|---|
| `K` | Hover: show type / docs for symbol under cursor |
| `gd` | Go to definition |
| `gt` | Go to type definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `<C-o>` / `<C-i>` | Jump back / forward |
| `[d` / `]d` | Previous / next diagnostic (error/warning) |
| `<Space>dl` | Open diagnostics list (all errors in project) |
| `<Space>ds` | Document symbols in current file |
| `<Space>ca` | Code action (quick fixes, imports, etc.) |
| `<Space>rn` | Rename symbol across project |
| `<Space>cf` | Format buffer |

### Testing (vim-test + vimux)

Runs in the neighboring tmux pane.

| Key | Action |
|---|---|
| `\rf` | Run nearest test (at cursor) |
| `\rt` | Run all tests in file |
| `\rl` | Re-run last test |
| `\ra` | Run full test suite |

### Quick reminders

`<Space>ff` find files · `<Space>fg` live grep · `<Space>e` toggle file tree · `<Space>gs` git status.

## Install

Run `./install.sh` to symlink everything into `$HOME`.
