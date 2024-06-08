return {
    "maxmx03/solarized.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
        vim.o.background = "light"
        require("solarized").setup({
            enables = {
                bufferline = true,
                cmp = true,
                diagnostic = true,
                editor = true,
                gitsign = true,
                indentblankline = true,
                lsp = true,
                neogit = true,
                neotree = true,
                syntax = true,
                telescope = true,
                tree = true,
                treesitter = true,
                whichkey = true,
            },
            vim.cmd.colorscheme("solarized"),
        })
    end,
}
