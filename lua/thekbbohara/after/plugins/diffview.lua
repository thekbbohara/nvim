return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
		{ "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
		{ "<leader>dH", "<cmd>DiffviewFileHistory %<cr>", desc = "History of current file" },
		{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
	},
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
			file_panel = {
				win_config = { height = 16 },
			},
			view = {
				default = {
					layout = "diff2_horizontal",
				},
			},
		})
	end,
}
