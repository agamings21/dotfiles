return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["<C-b>"] = "close_window",
					["<C-n>"] = function()
            vim.cmd("wincmd l")
					end,
				},
			},
			filesystem = {
				window = {
					mappings = {
					["<C-n>"] = function()
            vim.cmd("wincmd l")
					end,
					},
				},
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		--		vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>b", ":Neotree toggle show buffers right<cr>", {})
		vim.keymap.set("n", "<leader>s", ":Neotree float git_status<cr>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<C-b>", function()
			local manager = require("neo-tree.sources.manager")
			local renderer = require("neo-tree.ui.renderer")

			local state = manager.get_state("filesystem")
			local window_exists = renderer.window_exists(state)

			if window_exists == true then
				vim.cmd("Neotree close")
			else
				vim.cmd("Neotree filesystem show")
			end
		end, { desc = "nvim-tree: toggle" })
	end,
}
