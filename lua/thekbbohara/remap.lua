vim.g.mapleader = " "
local map = vim.keymap.set
local conf = {noremap = true, silent = true}
map("n", "<leader>fe", vim.cmd.Ex)
map("i", "jk", '<Esc>', conf)
map("n", "<leader>w", vim.cmd.w, conf)
