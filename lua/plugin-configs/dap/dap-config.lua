local M = {}


local function config_dapi_and_sign()
	local dap_install = require("dap-install")
	dap_install.setup {
		installation_path = vim.fn.stdpath "data".."/dapinstall/"
	}

	vim.fn.sign_define("DapBreakpoint",{
		text = "",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("DapBreakpointRejected", {
		text = "",
	    texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	})
end


local function config_dapui()
	local dap, dapui = require("dap"), require("dapui")

	local debug_open = function()
		dapui.open()
		vim.api.nvim_command("DapVirtualTextEnable")
		vim.api.nvim_command("NvimTreeClose")
	end

	local debug_close = function()
		dap.repl.close()
		dapui.close()
		vim.api.nvim_command("DapVirtualTextDisable")
	end

	dap.listeners.after.event_initialized["dapui_config"] = function()
		debug_open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		debug_close()
	end

	dap.listeners.before.event_exited["dapui_config"]     = function()
		debug_close()
	end

	dap.listeners.before.disconnect["dapui_config"]       = function()
		debug_close()
	end
end

local function config_debuggers()
	local dap = require("dap")
	-- require("dap.ext.vscode").load_launchjs(nil, cppdbg = { 'cpp' })
	require("plugin-configs.dap.dap-python")
end

function M.setup()
	config_dapi_and_sign()
	config_dapui()
end

return M
