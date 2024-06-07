return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            git_status_colors = {
                added = "Green",
                deleted = "Red",
                modified = "Blue",
                renamed = "Magenta",
                untracked = "Cyan",
                ignored = "DarkGrey",
                unstaged = "Orange",
                staged = "Green",
                conflict = "Red",
            },
            default_component_configs = {
                git_status= {
                    symbols = {
                        unstaged = "",
                        conflict = "⚡",
                    },
                },
            },
        })
    end,
}
