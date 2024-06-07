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
                python = { "isort", "black" },
                toml = { "taplo" },
            },
        })
    end,
}