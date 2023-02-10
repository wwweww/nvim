local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end


local null_ls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- require('mason-null-ls').setup({
--     automatic_setup = true,
--     ensure_installed = {'golines', 'buf'}
-- })
--
-- require 'mason-null-ls'.setup_handlers {
--     function(source_name, methods)
--       -- all sources with no handler get passed here
--
--       -- To keep the original functionality of `automatic_setup = true`,
--       -- please add the below.
--       require("mason-null-ls.automatic_setup")(source_name, methods)
--     end,
--     stylua = function(source_name, methods)
--       null_ls.register(null_ls.builtins.formatting.stylua)
--     end,
-- }


local souces = {
    null_ls.builtins.diagnostics.buf,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.autopep8
}

-- will setup any installed and configured sources above
null_ls.setup({
    sources = sources,
    debug = true,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting()
                    async_formatting(bufnr)
                end,
            })
        end
    end,
})
