require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-nvim-dap").setup({
  ensure_installed = { "python" },
  automatic_setup = true
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    -- "sumneko_lua",
    "clangd",
    "pyright",
    "html",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require'lspconfig'.pyright.setup{}
require"lspconfig".clangd.setup{}
require"lspconfig".tsserver.setup{}
require"lspconfig".gopls.setup{}
require'lspconfig'.golangci_lint_ls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.dockerls.setup{}
