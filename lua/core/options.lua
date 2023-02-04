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

-- 自动换行
vim.o.wrap = true

-- 开启鼠标
vim.o.mouse = 'a'

-- 主题颜色
vim.o.termguicolors = true

-- 设置主题

-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
-- vim.cmd.colorscheme('tokyonight-moon')

-- vim.cmd[[colorscheme nord]]
-- vim.cmd.colorscheme('palenightfall')
vim.cmd[[colorscheme rose-pine]]

-- 背景透明设置
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

