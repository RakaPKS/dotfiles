return {
    { 
    "lukas-reineke/indent-blankline.nvim",
    after = "nvim-treesitter",
     main = "ibl",
     config = function()
        
        require("ibl").setup {
             indent = { 
                char = "▏",
            },
            scope = { enabled = true},
        }
    end
    }
}