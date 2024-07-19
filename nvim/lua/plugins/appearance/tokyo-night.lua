return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
        require("tokyonight").setup({
            style = "storm",
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = { bold = true },
                variables = {},
                sidebars = "dark",
                floats = "dark",
            },
            sidebars = { "qf", "vista_kind", "terminal", "packer" },
            day_brightness = 0.3,
            on_colors = function(colors)
                colors.border = "#1A1B26"
                colors.comment = "#5c6a92"  -- Brighter blue for comments
                
            end,
            on_highlights = function(highlights, colors)
                highlights.Statement = { fg = colors.purple, bold = true }
                highlights.Type = { fg = colors.yellow, italic = true }
                highlights.Function = { fg = colors.blue, bold = true }
                highlights.Comment = { fg = colors.comment, italic = true}  -- Bold and italic comments
            end,
        })
        vim.cmd.colorscheme("tokyonight")
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#7aa2f7', bold=true })
        vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
    end
}