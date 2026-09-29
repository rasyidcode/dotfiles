return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -----------------------------------------------------------
            -- C LANGUAGE SERVER (clangd)
            -----------------------------------------------------------
            vim.lsp.enable({ 'clangd', 'lua_ls' })

            -----------------------------------------------------------
            -- FORMAT ON SAVE (clang-format)
            -----------------------------------------------------------
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.c", "*.h", "*.lua" },
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })

            -----------------------------------------------------------
            -- LSP KEYMAPS
            -----------------------------------------------------------
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set("n", "K", vim.lsp.buf.hover)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        end
    }, 
}
