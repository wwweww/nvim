require("toggleterm").setup{
	shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
}

