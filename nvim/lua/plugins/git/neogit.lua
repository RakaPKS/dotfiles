return {
    "NeogitOrg/neogit",
    dependencies = {

        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
    config = function()
        require("neogit").setup({
            disable_signs = false,
            disable_hint_icons = false,
            disable_context_highlighting = false,
            disable_commit_confirmation = false,
            auto_refresh = true,
            integrations = {
                diffview = true,
                telescope = true,
            },
        })
    end,
}
