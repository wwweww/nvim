require("toggleterm").setup{
---@diagnostic disable-next-line: undefined-global
	shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
	float_opts = {
		border = "curved"
	}
}

-- 自定义终端√
local Terminal  = require('toggleterm.terminal').Terminal

-- 悬浮终端

local floating_terminal = Terminal:new({
	direction = 'float',
	hidden = true
})


function _floating_terminal()
	floating_terminal:toggle()
end

vim.keymap.set("n", "<LEADER>oft", ":lua _floating_terminal()<CR>")
