return {
    {
        "talha-akram/noctis.nvim",
        lazy = true,
        priority = 1000,
        enabled = false,
        config = function()
            require("noctis.nvim").setup()
            vim.cmd.colorscheme("noctis_lux")
        end

    },
}
