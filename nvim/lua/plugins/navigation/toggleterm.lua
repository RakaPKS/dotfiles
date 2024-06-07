return {
    {
        "akinsho/toggleterm.nvim",

        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-t>]],
                shade_terminals = true, -- Shade the inactive terminal background
                shading_factor = 2, -- The degree by which to shade the inactive terminal area
                direction = "float",
                float_opts = {
                    border = "curved", -- Set the border style for the floating window
                },
            })
        end,
    },
}
