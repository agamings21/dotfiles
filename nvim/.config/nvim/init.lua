local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.diagnostic.config({
    virtual_text = true,
})
require("vim-options")
require("lazy").setup("plugins")

-- vim.cmd("Neotree show")

-- Open alpha dashboard on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.schedule(function()
			require("neo-tree.command").execute({
				source = "filesystem",
				action = "show",
			})
		end)
	end,
})
