vim.g.mapleader = " "

-- 减少输入
local keymap = vim.keymap.set

-- ---------- 插入模式 ----------
-- i
-- shiht + cr直接换行
keymap("i", "<S-Enter>", "<Esc>O")

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
keymap("n", "R", ":so<CR>")
---------------------------------

-- 打开文件树
keymap("n", "<C-b>", ":NvimTreeToggle<CR>")

-- 切换 buffer
keymap("n", "<C-l>", ":bnext<CR>")
keymap("n", "<C-h>", ":bprevious<CR>")
-- 关闭
---------------------------------



-- -----------------------------n END



-- ---------- 视觉模式 ----------
-- v

-- -----------------------------v END
