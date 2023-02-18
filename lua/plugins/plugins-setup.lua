local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- 配置文件自动更新 安装插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'

  -- 插件在这安装
  --
  use 'Abstract-IDE/Abstract-cs'

  use 'shaunsingh/nord.nvim' -- 主题

  use "sainnhe/everforest"

  use "yonlu/omni.vim"

  use 'navarasu/onedark.nvim'

  use "EdenEast/nightfox.nvim"

  use "sainnhe/edge"

use {
  'JoosepAlviste/palenightfall.nvim',
}
use {
  'folke/tokyonight.nvim',
}

use {
  'rose-pine/neovim',
  as = 'rose-pine'
}


--- 状态栏

use "windwp/windline.nvim"

  -- use({
  -- "NTBBloodbath/galaxyline.nvim",
  -- -- your statusline
  -- config = function()
  --   require("galaxyline.themes.eviline")
  -- end,
  -- }) -- 状态栏

  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- } -- 状态栏

  use {
  'nvim-tree/nvim-tree.lua',

  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  } -- 文件树

  use "nvim-treesitter/nvim-treesitter" -- 高亮语法 
  use "p00f/nvim-ts-rainbow" -- 彩虹括号

  -- mason
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }

-- null-ls
  use {
    "nvim-lua/plenary.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
  }

-- todo
  use "folke/todo-comments.nvim"

  -- 代码片段
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

 -- 一些小功能
  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }

-- 自能缩进
  use {'Abstract-IDE/penvim'}
  use "nmac427/guess-indent.nvim"
  use "Darazaki/indent-o-matic"
  use 'tweekmonster/braceless.vim'

-- 反转输入 T -> F on -> off
  use "nguyenvukhang/nvim-toggler"

-- 命令行终端
  use "akinsho/toggleterm.nvim"

-- 变量rename
  use "glepnir/lspsaga.nvim"

-- 缩进线
  use "lukas-reineke/indent-blankline.nvim"

-- 透明
  use "xiyaowong/nvim-transparent"

-- 平滑光标
  use { 'gen740/SmoothCursor.nvim'}

-- 调试
  use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
  use "ravenxrz/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  -- use { "jbyuki/one-small-step-for-vimkind", module = "osv" }
  use "nvim-telescope/telescope-dap.nvim"
  use "jay-babu/mason-nvim-dap.nvim"

-- 启动页
  use 'glepnir/dashboard-nvim'

-- coc代码补全
  -- use "neoclide/coc.nvim"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
