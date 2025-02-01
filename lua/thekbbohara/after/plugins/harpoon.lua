return {
	"RichGuk/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		local ui = require("harpoon.ui")
		local map = vim.keymap.set
		local telescope = require("telescope")
		harpoon:setup({
			settings = {
				save_on_toggle = true, -- Save state on window toggle
			},
		})
		map("n", "<leader>a", function()
			harpoon:list():add()
		end)
		map("n", "<leader>hi", function()
			ui:toggle_quick_menu(harpoon:list())
		end)
		map("n", "<leader>fh", ":Telescope harpoon marks<CR>")

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		map("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
