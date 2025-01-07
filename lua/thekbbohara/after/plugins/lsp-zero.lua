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
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		-- Enable Mason
		require("mason").setup()

		-- Ensure the required LSP servers are installed
		require("mason-lspconfig").setup({
			ensure_installed = { "vtsls", "eslint" }, -- Add your desired servers here
		})

		-- Configure LSP servers
		local lspconfig = require("lspconfig")
		lspconfig.vtsls.setup({})
		lspconfig.eslint.setup({})

		-- Set up nvim-cmp for autocompletion
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			local map = vim.keymap.set
			map("n", "gd", vim.lsp.buf.definition, opts)
			map("n", "K", vim.lsp.buf.hover, opts)
			map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			map("n", "<leader>vd", vim.diagnostic.open_float, opts)
			map("n", "[d", vim.diagnostic.goto_next, opts)
			map("n", "]d", vim.diagnostic.goto_prev, opts)
			map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
			map("n", "<leader>vrr", vim.lsp.buf.references, opts)
			map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
			map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		end

		-- Attach the on_attach function to LSP servers
		lspconfig.vtsls.setup({
			on_attach = on_attach,
		})
		lspconfig.eslint.setup({
			on_attach = on_attach,
		})
	end,
}
