-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- key mapping
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- write and quit with leader w/q
-- map("n","<leader>w",":w<cr>",opts) -- available on none-ls.lua
map("n", "<leader>q", ":wq<cr>", opts)

-- open :NvimTree with leader nt
map("n", "<leader>nt", ":NvimTreeOpen<cr>")

-- go to command mode with esc from normal mode
map("n", "<Esc>", ":")

-- buffer
vim.map("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })
vim.map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })

-- insert to normalkeymap
map("i", "jk", "<Esc>")
map("i", "<C-j>", "<Esc>ja", opts)
map("i", "<C-k>", "<Esc>ka", opts)
map("i", "<C-h>", "<Esc>i", opts)
map("i", "<C-l>", "<Esc>la", opts)

-- move lines up an down
-- for insert mode
map({ "i", "n" }, "<C-S-J>", "<Esc>:m+<cr>", opts)
map({ "i", "n" }, "<C-S-K>", "<Esc>:m-2<cr>", opts)
-- map("i", "<C-H>", "<Esc>^i", opts)
-- map("i", "<C-L>", "<Esc>$a", opts)

-- moves oneword forward or backward
map("i", "<C-w>", "<Esc>wli", opts)
map("i", "<C-b>", "<Esc>bi", opts)
-- delete in _ reg
map({ "v", "n" }, "x", '"_x', opts)
map({ "n", "v" }, "dx", '"_dd', opts)

--select all
map("n", "<C-a>", "gg0vG$", opts)

--increment / decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Split
map("n", "ss", ":vsplit<cr>", opts)
map("n", "sh", ":split<cr>", opts)

