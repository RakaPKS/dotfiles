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

            for _, server in ipairs(servers) do
                local opts = {
                    capabilities = cmp_nvim_lsp.default_capabilities(),
                    inlay_hints = {
                        enabled = true,
                    },
                }

                -- Check if a custom handler exists for the server
                local has_custom_handler, custom_handler = pcall(require, "handlers." .. server)
                if has_custom_handler then
                    -- Merge the custom handler settings with the default settings
                    opts = vim.tbl_deep_extend("force", opts, custom_handler)
                end

                lspconfig[server].setup(opts)
            end
        end,
    },
}
