vim.g.mapleader = " "

-- 减少输入
local keymap = vim.keymap.set

------------ 分屏 ---------------

keymap("", "sl", ":set splitright<CR>:vsplit<CR>")
keymap("", "sh", ":set nosplitright<CR>:vsplit<CR>")
keymap("", "sk", ":set nosplitbelow<CR>:split<CR>")
keymap("", "sj", ":set splitbelow<CR>:split<CR>")

keymap("n", "<UP>", ":res +5<CR>")
keymap("n", "<down>", ":res -5<CR>")
keymap("n", "<left>", ":vertical resize-5<CR>")
keymap("n", "<right>", ":vertical resize+5<CR>")

---------------------------------



-- ---------- 插入模式 ----------
-- i
-- shiht + cr直接换行
keymap("i", "<S-Enter>", "<Esc>o")
keymap("i", "<C-/>", "<Esc>gcca")


-- -----------------------------i END



-- ---------- 普通模式 ----------
-- n

-- 搜索 上一个 下一个 取消高亮
keymap("n", "=", "nzz")
keymap("n", "-", "Nzz")
keymap("n", "<LEADER><CR>", ":noh<CR>")
---------------------------------

-- 保存 关闭 重载配置
keymap("n", "S", ":w<CR>")
keymap("n", "s", "<nop>")
keymap("n", "Q", ":q<CR>")
keymap("n", "R", ":source $MYVIMRC<CR>")
---------------------------------

-- 打开文件树
keymap("n", "<C-b>", ":NvimTreeToggle<CR>")

-- 打开终端
keymap("", "<C-\\>", ":ToggleTerm<CR>")


-- 切换 buffer
keymap("n", "<C-l>", ":bnext<CR>")
keymap("n", "<C-h>", ":bprevious<CR>")
-- 关闭
keymap("n", "<LEADER>bw", ":bdelete<CR>")
---------------------------------



-- -----------------------------n END



-- ---------- 视觉模式 ----------
-- v
keymap("v", "<C-/>", "gc")

-- -----------------------------v END


-- ---------- 终端快捷键 -----------

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- ---------------------------------
--
-- debug
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

