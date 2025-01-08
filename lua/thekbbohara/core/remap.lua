vim.g.mapleader = " "
local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-- write/quit
map("n", "<leader>w", ":fm<cr>:w<cr>", opts)
map("n", "<leader>q", ":wq<cr>", opts)

-- insert to normalkeymap
map("i", "jk", "<Esc>")
map("i", "<C-j>", "<Esc>ja", opts)
map("i", "<C-k>", "<Esc>ka", opts)
map("i", "<C-h>", "<Esc>i", opts)
map("i", "<C-l>", "<Esc>la", opts)

-- Clipboard (copy/paste)
map("n", "Y", '"+yy',opts)
map("v", "Y", '"+y',opts)
map({"n", "v"}, "P", '"+p',opts)

-- go to command mode with esc from normal mode
map("n", "<Esc>", ":")


-- buffer
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })

-- insert to normalkeymap
map("i", "jk", "<Esc>")
map("i", "<C-j>", "<Esc>ja", opts)
map("i", "<C-k>", "<Esc>ka", opts)
map("i", "<C-h>", "<Esc>i", opts)
map("i", "<C-l>", "<Esc>la", opts)


-- move lines up an down
-- for insert mode
map("n", "<C-S-J>", "<Esc>:m+<cr>", opts)
map("n", "<C-S-K>", "<Esc>:m-2<cr>", opts)
-- map("v", "<C-S-J>", ":m+<cr>", opts)
-- map("v", "<C-S-K>", ":m-2<cr>", opts)
map("i", "<C-S-J>", "<Esc>:m+<cr>i", opts)
map("i", "<C-S-K>", "<Esc>:m-2<cr>i", opts)


--select all
map("n", "<C-a>", "gg0vG$", opts)

--increment / decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Split
map("n", "ss", ":vsplit<cr>", opts)
map("n", "sh", ":split<cr>", opts)
