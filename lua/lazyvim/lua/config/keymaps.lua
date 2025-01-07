-- Set <space> as the leader key
-- See `:help mapleader`
-- vim.g.maplocalleader = " "
-- vim.g.mapleader = " "
-- key mapping
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- write and quit with leader w/q
keymap.set("n", "<leader>w", ":w<cr>", opts) -- available on none-ls.lua
keymap.set("n", "<leader>q", ":wq<cr>", opts)

-- open :NvimTree with leader nt
-- keymap.set("n", "<leader>nt", ":NvimTreeOpen<cr>")

-- go to command mode with esc from normal mode
keymap.set("n", "<Esc>", ":")

-- buffer
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous Buffer" })

-- insert to normalkeymap
keymap.set("i", "jk", "<Esc>")

-- move lines up an down
-- for insert mode
keymap.set({ "i", "n" }, "<C-S-J>", "<Esc>:m+<cr>", opts)
keymap.set({ "i", "n" }, "<C-S-K>", "<Esc>:m-2<cr>", opts)
-- keymap.set("i", "<C-H>", "<Esc>^i", opts)
-- keymap.set("i", "<C-L>", "<Esc>$a", opts)

-- moves oneword forward or backward
keymap.set("i", "<C-w>", "<Esc>wli", opts)
keymap.set("i", "<C-b>", "<Esc>bi", opts)
-- delete in _ reg
keymap.set({ "v", "n" }, "x", '"_x', opts)
keymap.set({ "n", "v" }, "dx", '"_dd', opts)

--select all
keymap.set("n", "<C-a>", "gg0vG$", opts)

--increment / decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split
keymap.set("n", "ss", ":vsplit<cr>", opts)
keymap.set("n", "sh", ":split<cr>", opts)

-- Obsidian
-- Obsidian
vim.keymap.set(
  "n",
  "<leader>oc",
  "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
  { desc = "Obsidian Check Checkbox" }
)
keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
