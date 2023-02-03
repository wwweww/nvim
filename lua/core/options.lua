-- 开启基本行号显示 显示操作
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.hlsearch = true

-- 搜索自能大小写
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- 默认新窗口在右和下
vim.o.splitright = true
vim.o.splitbelow = true

-- 主题颜色
vim.o.termguicolors = true

-- 设置主题
-- vim.cmd[[colorscheme nord]]
vim.cmd.colorscheme('tokyonight-moon')

