return {
    {
        {
            "rust-lang/rust.vim",
            ft = { "rust" },
            config = function()
                vim.g.rustfmt_autosave = 1
            end,
        },
    },
    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        version = "^3",
        lazy = true,
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                        -- Keymaps and other settings can be added here
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                command = "clippy",
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                },
                            },
                        },
                    },
                },
            }
        end,
    },
}
