return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        lazy = false,

        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            mason_lspconfig.setup({
                automatic_installation = true,
            })

            local servers = mason_lspconfig.get_installed_servers()

            local server_settings = {
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "check",
                            },
                            cargo = {
                                allFeatures = true,
                            },
                            procMacro = {
                                enable = true,
                            },
                            inlayHints = {
                                enable = true,
                                showParameterNames = true,
                                parameterHintsPrefix = "<- ",
                                otherHintsPrefix = "=> ",
                                parameterHints = {
                                    enabled = true,
                                    hideNamedArguments = false,
                                },
                                typeHints = {
                                    enable = true,
                                    hideClosureInitialization = false,
                                    hideNamedConstructor = false,
                                },
                                chainingHints = { enable = true },
                            },
                        },
                    },
                },
            }
            for _, server in ipairs(servers) do
                local opts = {
                    capabilities = cmp_nvim_lsp.default_capabilities(),
                    inlay_hints = {
                        enabled = true,
                    },
                }

                -- Check if a custom handler exists for the server
                if server_settings[server] then
                    opts = vim.tbl_deep_extend("force", opts, server_settings[server])
                end

                lspconfig[server].setup(opts)
            end
        end,
    },
}
