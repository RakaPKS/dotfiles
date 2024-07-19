return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-project.nvim",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header to XD
        dashboard.section.header.val = {
            "                  ",
            " ██╗  ██╗██████╗  ",
            " ╚██╗██╔╝██╔══██╗ ",
            "  ╚███╔╝ ██║  ██║ ",
            "  ██╔██╗ ██║  ██║ ",
            " ██╔╝ ██╗██████╔╝ ",
            " ╚═╝  ╚═╝╚═════╝  ",
            "                  ",
        }

        -- Custom footer with date and plugin count
        local function footer()
            local stats = require("lazy").stats()
            local total_plugins = stats.count
            local datetime = os.date(" Today is %a %d %b")
            return string.format("󰏗 %d plugins in total", total_plugins)
                .. "\n" .. datetime
        end   
        dashboard.section.footer.val = footer()

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  󰈞 Find file", ":Telescope find_files <CR>"),
            dashboard.button("p", "   Projects", ":lua require'telescope'.extensions.project.project{}<CR>"),
            dashboard.button("r", "  󱋡 Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("q", "  󰩈 Quit NVIM", ":qa<CR>"),
        }

        -- Define the new layout
        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.footer,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
        }

        -- Send config to alpha
        alpha.setup(dashboard.config)
        
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                vim.opt_local.foldenable = false
                vim.opt_local.guifont = "Operator-caska,MesloLGSDZ Nerd Font:h25"
            end
        })

        -- Reset font when leaving alpha buffer
        vim.api.nvim_create_autocmd("BufUnload", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype == "alpha" then
                    vim.opt.guifont = "Operator-caska,MesloLGSDZ Nerd Font:h14"
                end
            end
        })

    end
}