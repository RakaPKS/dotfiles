return {
    "stevearc/conform.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            format_on_save = { lsp_fallback = true },
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
            },
        })
        vim.keymap.set("n", "<leader>gf", function()
            conform.format({ bufnr = 0 })
        end, {})
    end,
}
