require("plugins.plugins-setup")
require("core.options")
require("core.keymaps")

-- plugin
-- require("plugin-configs.lualine")
require("plugin-configs.nvim-tree")
require("plugin-configs.treesitter")
require("plugin-configs.lsp")
require("plugin-configs.cmp") -- 打开后tab补全有问题
require("plugin-configs.comment")
require("plugin-configs.autopairs")
require("plugin-configs.bufferline")
require("plugin-configs.gitsigns")
require("plugin-configs.telescope")
-- require("plugin-configs.guess-indent")
require("plugin-configs.toggleterm")
require("plugin-configs.lspsaga")
require("plugin-configs.null-ls")
require("plugin-configs.blankline")
-- require("plugin-configs.indent-o-matic")
-- require("plugin-configs.braceless")
require("plugin-configs.transparent")
require("plugin-configs.windline")
require("plugin-configs.smoothcursor")
require("plugin-configs.bashboard")
require("plugin-configs.penvim")
require("plugin-configs.toggler")
require("plugin-configs.todo")
-- require("plugin-configs.coc")
--
--
-- require("core.test")

-- vim.cmd [[autocmd FileType python BracelessEnable +indent +fold]]
--
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.zimbu = {
  install_info = {
    url = "~/projects/tree-sitter-zimbu", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "zu", -- if filetype does not match the parser name
}
