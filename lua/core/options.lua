-- 开启基本行号显示 显示操作
vim.o.number = true
vim.o.relativenumber = true
-- vim.o.cursorline = true
-- vim.o.cursorcolumn = true
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.hlsearch = true

-- 末尾留五行
vim.o.scrolloff = 6

-- 缩进
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- 搜索自能大小写
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- 默认新窗口在右和下
vim.o.splitright = true
vim.o.splitbelow = true

-- 自动换行
vim.o.wrap = true

-- 开启鼠标
vim.o.mouse = 'a'

-- 系统剪切板
vim.opt.clipboard:append("unnamedplus")

if vim.fn.has("wsl") then
 vim.cmd [[
 augroup Yank
 autocmd!
 autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe', @")
 augroup END
 ]]
end

-- 设置字体
vim.o.guifont = "SF Mono Light:h15"

-- 主题颜色
vim.o.termguicolors = true

-- 设置主题

-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
-- vim.cmd.colorscheme('tokyonight-night')
-- vim.cmd.colorscheme("rose-pine")

-- vim.cmd[[colorscheme nord]]
-- vim.cmd.colorscheme('palenightfall')
-- vim.cmd.colorscheme("omni")
-- vim.cmd.colorscheme("edge")
--
require("astrotheme").setup({
 palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
})

-- vim.cmd.colorscheme('palenightfall')
vim.cmd.colorscheme("astrodark")


-- 打开时光标在上一次的位置
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
 pattern = "*",
 command = [[if line("'\"") >= 1 && line("'\"") <= line("$") |   exe "normal! g`\"" | endif]],
})

-- Neovide Config
vim.g.neovide_cursor_vfx_mode = "*"
-- vim.g.neovide_transparency = 0.95
