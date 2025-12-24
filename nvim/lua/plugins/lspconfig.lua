return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -----------------------------------------------------------
            -- C LANGUAGE SERVER (clangd)
            -----------------------------------------------------------
            local lspconfig = require("lspconfig")
            lspconfig.cland.setup({
                cmd = { "cland", "--background-index" }
            })

            -----------------------------------------------------------
            -- FORMAT ON SAVE (clang-format)
            -----------------------------------------------------------
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.c", "*.h" },
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
