return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local function set_nvim_tree_highlights()
			-- Example: Set the background color of the nvim-tree window
			vim.api.nvim_set_hl(0, "NvimTreeNormal", { guibg = "#fffff" })
			-- Example: Set the color for opened folders
			vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { guifg = "#61afef" })
			-- Add more highlight customizations as needed
		end
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				side = "right",
			},
			renderer = {
				icons = {
					show = {
						git = true, -- show git icons
					},
					glyphs = {
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
		vim.keymap.set("n", "<leader>fe", ":NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
	end,
}
