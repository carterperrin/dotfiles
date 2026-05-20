# Neovim Keybindings

Leader key is `<Space>`. Backslash (`\`) aliases are provided for muscle memory.

## File Navigation

| Key | Action |
|-----|--------|
| `\ff` / `<Space>ff` | Find files (fuzzy) |
| `\fg` / `<Space>fg` | Live grep across project |
| `\fb` / `<Space>fb` | Switch between open buffers |
| `<Space>fr` | Recent files |
| `<Space>fw` | Grep word under cursor |
| `<C-p>` | Find files |

## File Explorer (Neo-tree)

| Key | Action |
|-----|--------|
| `\nt` / `<Space>e` | Toggle file explorer |
| `\nf` / `<Space>nf` | Reveal current file in explorer |

## LSP (works in TS, Terraform, etc.)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `<Space>ds` | Document symbols |
| `<Space>dl` | Diagnostics list |
| `[d` / `]d` | Previous / next diagnostic |
| `<C-o>` | Jump back (after gd, etc.) |
| `<C-i>` | Jump forward |

## Testing (vim-test + vimux)

| Key | Action |
|-----|--------|
| `\rf` | Run nearest test (at cursor) |
| `\rt` | Run all tests in file |
| `\rl` | Re-run last test |
| `\ra` | Run full test suite |

All test commands run in the neighboring tmux pane.

## Git

| Key | Action |
|-----|--------|
| `<Space>gs` | Git status (fugitive) |
| `<Space>gb` | Git blame |
| `<Space>gd` | Git diff split |
| `]h` / `[h` | Next / previous git hunk |
| `<Space>hp` | Preview hunk |
| `<Space>hs` | Stage hunk |
| `<Space>hr` | Reset hunk |
| `<Space>hb` | Blame current line |

## Editing

| Key | Action |
|-----|--------|
| `\cc` / `gcc` | Toggle comment (line) |
| `\cc` / `gc` | Toggle comment (visual selection) |
| `cs"'` | Change surrounding `"` to `'` |
| `ds"` | Delete surrounding `"` |
| `ysiw"` | Add `"` around word |
| `<Space>cf` | Format buffer |
| `<Space>w` | Save file |

## Windows & Buffers

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between splits |
| `<C-Up/Down/Left/Right>` | Resize splits |
| `[b` / `]b` | Previous / next buffer |
| `<Space>bd` | Close buffer |

## Scrolling & Search

| Key | Action |
|-----|--------|
| `<C-d>` / `<C-u>` | Scroll half page (centered) |
| `<Space>nh` | Clear search highlight |
| `n` / `N` | Next / previous match (centered) |

## Discovery

Press `<Space>` and wait — **which-key** will show all available keybindings.
