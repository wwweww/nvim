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

require("lspconfig").sumneko_lua.setup {
  capabilities = capabilities,
}

require'lspconfig'.pyright.setup{}
require"lspconfig".clangd.setup{}
require"lspconfig".tsserver.setup{}
