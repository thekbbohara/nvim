-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "typescript", "javascript", "tsx", "python", "lua", "json" },
			sync_install = false,
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,
      textobjects = {enable=true},
			highlight = {
				enable = true,
				-- disable = { "c", "rust" },
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				additional_vim_regex_highlighting = false,
			},
		})

	end,
}
