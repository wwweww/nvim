-- 开启基本行号显示 显示操作
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.hlsearch = true

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

-- 主题颜色
vim.o.termguicolors = true

-- 设置主题

-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
-- vim.cmd.colorscheme('tokyonight-moon')

-- vim.cmd[[colorscheme nord]]
-- vim.cmd.colorscheme('palenightfall')
vim.cmd[[colorscheme rose-pine]]
-- vim.cmd.colorscheme("omni")
-- vim.cmd.colorscheme("edge")
-- vim.cmd.colorscheme("nightfox")

-- require("onedark").setup({
-- 	style = "darker"
-- })
-- require("onedark").load()

-- 背景透明设置
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])


vim.cmd[[
if executable('clipboard-provider')
 let g:clipboard = {
         \ 'name': 'myClipboard',
         \     'copy': {
         \         '+': 'clipboard-provider copy',
         \         '*': 'clipboard-provider copy',
         \     },
         \     'paste': {
         \         '+': 'clipboard-provider paste',
         \         '*': 'clipboard-provider paste',
         \     },
         \ }
endif
]]

-- 打开时光标在上一次的位置
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "*",
    command = [[if line("'\"") >= 1 && line("'\"") <= line("$") |   exe "normal! g`\"" | endif]],
  })

-- -- 打开时开启智能缩进
-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--     pattern = "*",
--     command = [[BracelessEnable +indent +fold]]
-- })
