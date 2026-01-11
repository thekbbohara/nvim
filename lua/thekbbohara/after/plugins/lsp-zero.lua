return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },

		-- Snippets

		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		-- Enable Mason
		require("mason").setup()

		-- Ensure the required LSP servers are installed
		require("mason-lspconfig").setup({
			ensure_installed = { "vtsls", "eslint", "tailwindcss", "html" }, -- Add your desired servers here
		})

		-- Configure LSP servers
		local lspconfig = require("lspconfig")
		lspconfig.vtsls.setup({})
		lspconfig.eslint.setup({})
		lspconfig.hyprls.setup({})
		lspconfig.hyprls.setup({})
		lspconfig.prismals.setup({})

		-- Set up nvim-cmp for autocompletion
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<A-p>"] = cmp.mapping.select_prev_item(),
				["<A-n>"] = cmp.mapping.select_next_item(),
				["<A-y>"] = cmp.mapping.confirm({ select = true }),
				["<A-Space>"] = cmp.mapping.complete(),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
		-- local on_attach = function(client, bufnr)
		local opts = { remap = false }
		local map = vim.keymap.set
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "<C-k>", vim.lsp.buf.hover, opts)
		map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		map("n", "<leader>vd", vim.diagnostic.open_float, opts)
		map("n", "[d", vim.diagnostic.goto_next, opts)
		map("n", "]d", vim.diagnostic.goto_prev, opts)
		map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		map("n", "<leader>vrr", vim.lsp.buf.references, opts)
		map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		-- end

		-- Attach the on_attach function to LSP servers
		-- typescript ls
		lspconfig.vtsls.setup({
			on_attach = on_attach,
		})
		-- tailwindcss
		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
		})
		-- eslint
		lspconfig.eslint.setup({
			on_attach = on_attach,
		})
		-- eslint
		lspconfig.pylsp.setup({
			on_attach = on_attach,
		})
		-- emmet ls
		lspconfig.emmet_language_server.setup({
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"pug",
				"typescriptreact",
			},
			-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
			-- **Note:** only the options listed in the table are supported.
			init_options = {
				---@type table<string, string>
				includeLanguages = {},
				--- @type string[]
				excludeLanguages = {},
				--- @type string[]
				extensionsPath = {},
				--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
				preferences = {},
				--- @type boolean Defaults to `true`
				showAbbreviationSuggestions = true,
				--- @type "always" | "never" Defaults to `"always"`
				showExpandedAbbreviation = "always",
				--- @type boolean Defaults to `false`
				showSuggestionsAsSnippets = false,
				--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
				syntaxProfiles = {},
				--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
				variables = {},
			},
		})
	end,
}
