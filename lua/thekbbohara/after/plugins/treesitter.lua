-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
return{
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require'nvim-treesitter.configs'.setup {
		  ensure_installed = { "typescript","javascript","python","lua" },

		  -- Install parsers synchronously (only applied to `ensure_installed`)
		  sync_install = false,

		  -- Automatically install missing parsers when entering buffer
		  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		  auto_install = false,

		  -- List of parsers to ignore installing (or "all")
		  -- ignore_install = { "javascript" },

		  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)

		  highlight = {
		    enable = true,
		    -- disable = { "c", "rust" },
		    -- Using this option may slow down your editor, and you may see some duplicate highlights.
		    additional_vim_regex_highlighting = false,
		  }
		}
	end
}
