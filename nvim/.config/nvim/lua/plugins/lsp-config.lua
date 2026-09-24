return {
	{
		"williamboman/mason.nvim",
		lazy = false,
    opts = {

				ensure_installed = { "netcoredbg" },

    },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("cmp").setup({
				sources = {
					{ name = "nvim_lsp" },
				},
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.enable("roslyn_ls")
			vim.lsp.config("roslyn_ls", {
				filetypes = { "razor", "cs" },
				capabilities = capabilities,
			})
			vim.lsp.config("lua_ls", {

				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.enable("terraform_ls")
			vim.lsp.config("terraform_ls", {
				capabilities = capabilities,
			})
     
			vim.lsp.enable("pylsp")
			vim.lsp.config("pylsp", {
				capabilities = capabilities,
			})
      
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
}
