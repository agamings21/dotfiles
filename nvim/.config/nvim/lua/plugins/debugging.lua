return {
	{ "mfussenegger/nvim-dap-python",
config = function()

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
end,
},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
				vim.cmd("Neotree close")
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
				vim.cmd("Neotree show")
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
				vim.cmd("Neotree show")
			end

			local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

			local netcoredbg_adapter = {
				type = "executable",
				command = mason_path,
				args = { "--interpreter=vscode" },
			}
			local dotnet = require("configs.nvim-dap-dotnet")

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					stopAtEntry = true,
					program = function()
						vim.fn.system("dotnet build")
						return dotnet.build_dll_path()
						--return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
			}
			dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
			dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

			vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<F5>", dap.continue, {})

			vim.keymap.set("n", "<S-F5>", dap.terminate, {})
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
			vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "DAP: Step Out" })

			vim.keymap.set(
				"n",
				"<leader>dt",
				"<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
				{ noremap = true, silent = true, desc = "debug nearest test" }
			)
		end,
	},
}
