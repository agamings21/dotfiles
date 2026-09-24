return {
	"mg979/vim-visual-multi",
	-- See https://github.com/mg979/vim-visual-multi/issues/241
	init = function()
		vim.g.VM_default_mappings = 0
		vim.g.VM_maps = {
			["Find Under"] = "",
		}
		vim.g.VM_add_cursor_at_pos_no_mappings = 1
		vim.g.VM_maps = {
			["Find Under"] = "<C-d>",
		  ["Find Subword Under"] = "<leader>d",
			["Select All"] = "<C-S-l>",
			["Skip Region"] = "<C-k>",
			["Remove Region"] = "<C-p>",
			["Add Cursor Down"] = "<M-j>",
			["Add Cursor Up"] = "<M-k>",
			["Add Cursor At Pos"] = "<leader>m",
		}
    vim.keymap.set("n", "<leader>m", "<Plug>(VM-Add-Cursor-At-Pos)")
	end,
}
