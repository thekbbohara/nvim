# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. The active config lives under `lua/thekbbohara/`. The `lua/lazyvim/` and `lua/old/` directories are archived/experimental configs — do not modify them unless explicitly asked.

## Architecture

Entry point: `init.lua` → `lua/thekbbohara/init.lua`

Load order:
1. `core/opt.lua` — vim options (2-space tabs, relative numbers, no mouse, etc.)
2. `core/remap.lua` — global keymaps (`<Space>` as leader)
3. `core/lazy.lua` — bootstraps lazy.nvim and imports plugins from two directories:
   - `lua/thekbbohara/plugins/` — plugin specs loaded at startup
   - `lua/thekbbohara/after/plugins/` — plugin specs with configs/keymaps (loaded after)

## Plugin Organization

| File | Plugin | Notes |
|------|--------|-------|
| `after/plugins/lsp-zero.lua` | lsp-zero, mason, nvim-cmp, LuaSnip | LSP stack; auto-installs `vtsls`, `eslint`, `tailwindcss`, `html` via mason |
| `after/plugins/telescope.lua` | telescope.nvim | File/grep search; ignores `node_modules`, `prisma/migrations`, images |
| `after/plugins/harpoon.lua` | harpoon2 | File bookmarking with telescope integration |
| `after/plugins/conform.lua` | conform.nvim | Format-on-save; prettier for JS/TS, black+isort for Python, stylua for Lua |
| `after/plugins/nvim-tree.lua` | nvim-tree | File explorer on the right side |
| `after/plugins/ufo.lua` | nvim-ufo | Code folding |
| `plugins/treesitter.lua` | nvim-treesitter | Highlights for TS, JS, TSX, Python, Lua, JSON |
| `plugins/catppuccin.lua` | catppuccin | Colorscheme (mocha, transparent background) |

## Key Keymaps

| Key | Action |
|-----|--------|
| `<leader>w` / `<leader>q` | Save / Save+quit |
| `<leader>ff` | Telescope find files |
| `<leader>fs` | Telescope live grep |
| `<leader>fb` | Telescope buffers |
| `<leader>fg` | Telescope git files |
| `<leader>fe` | Toggle NvimTree |
| `<leader>a` | Harpoon add file |
| `<leader>hi` | Harpoon quick menu |
| `<leader>fm` | Format with conform |
| `<leader>vca` | LSP code action |
| `<leader>vrn` | LSP rename |
| `gd` | Go to definition |
| `<C-k>` | LSP hover |
| `jk` (insert) | Escape to normal |
| `ss` / `sh` | Vertical / horizontal split |
| `Y` / `P` | Copy/paste system clipboard |

## Adding a Plugin

Create a new `.lua` file in `lua/thekbbohara/plugins/` (startup) or `lua/thekbbohara/after/plugins/` (deferred with config). Return a lazy.nvim plugin spec table. lazy.nvim auto-discovers all files in these directories.

## LSP Servers

Managed via Mason. Auto-installed: `vtsls`, `eslint`, `tailwindcss`, `html`. Additional servers configured (not auto-installed): `hyprls`, `prismals`, `pylsp`, `emmet_language_server`. To add a new server, add it to `ensure_installed` in `after/plugins/lsp-zero.lua` and call `vim.lsp.config(...)` + include it in `vim.lsp.enable(...)`.
