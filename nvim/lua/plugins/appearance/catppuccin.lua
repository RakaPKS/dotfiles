return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        enabled = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                integrations = {
                    bufferline = true,
                    cmp = true,
                    dap = true,
                    dap_ui = true,
                    diffview = true,
                    gitsigns = true,
                    neotree = true,
                    neogit = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    treesitter = true,
                    treesitter_context = true,
                    which_key = true,
                },
            })
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
}
