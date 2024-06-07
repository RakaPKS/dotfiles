return {
    { 
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-treesitter",
     main = "ibl",
     config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
        
        local hooks = require "ibl.hooks"

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e5a5b5" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e5d5b5" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#a5c5e5" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#d5c5a5" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b5e5a5" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d5b5e5" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#a5e5d5" })
        end)
        
        require("ibl").setup {
             indent = { 
                highlight = highlight ,
                char = "|",
            } 
        }
    end
    }
}