return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
        require("tokyonight").setup({
            -- Choose the style: "storm", "moon", or "night"
            style = "moon",
            -- Enable italic for comments
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = { bold = true },
                variables = {},
                sidebars = "dark",
                floats = "dark",
            },
            
            -- Sidebar-like windows like NvimTree should be darker
            sidebars = { "qf", "vista_kind", "terminal", "packer" },
            
            -- Make the backdrop darker
            day_brightness = 0.3,
            
            -- Adjustments for better readability
            on_colors = function(colors)
                colors.border = "#1A1B26"
            end,
            
            on_highlights = function(highlights, colors)
                -- Customize specific highlight groups
                highlights.Statement = { fg = colors.blue, bold = true }
                highlights.Type = { fg = colors.yellow, italic = true }
                highlights.Function = { fg = colors.blue, bold = true }
            end,
        })
        vim.cmd.colorscheme("tokyonight")
    end
}
