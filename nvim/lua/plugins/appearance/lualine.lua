return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
        local solarized_ok, solarized = pcall(require, "solarized")
        local tokyo_night_ok, tokyonight = pcall(require, "tokyonight")

        local lualine_options = {
            options = {
                disabled_filetypes = { "neo-tree" },
            },
        }

        if catppuccin_ok then
            lualine_options.options.theme = "catppuccin-macchiato"
        elseif solarized_ok then
            lualine_options.options.theme = "solarized"
        elseif tokyo_night_ok then
            lualine_options.options.theme = "tokyonight"
        else
            -- Set a default theme or provide a fallback
            lualine_options.options.theme = "auto"
        end

        require("lualine").setup({
            lualine_options,
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            }
            
        })
    end,
}

