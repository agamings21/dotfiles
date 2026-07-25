return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-\>]],
			direction = "float",
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,

			highlights = {
				Normal = {
					guibg = "#1e1e1e",
				},
				NormalFloat = {
					guibg = "#1e1e1e",
				},
			},
		})
		-- From terminal: move focus back to editor above
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])

    vim.keymap.set("n", "<leader>t", "<Cmd>ToggleTerm toggle<CR>")
    
    -- Used for when terminal was going to be located at the bottom of the screen
		-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<leader>t", function()
		-- 	local term = require("toggleterm.terminal").get(1)
		-- 	if term then
		-- 		term:focus()
		-- 		vim.schedule(function()
		-- 			vim.cmd("startinsert")
		-- 		end)
		-- 	end
		-- end, { silent = true })
	
    -- git terminal setup
    local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
	end,
}
