return {
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
        },
        config = function()
            require("diffview").setup({
                -- Diffview.nvim configuration options
                enhanced_diff_hl = true, -- Enable enhanced highlighting for the diff view
            })
        end,
    },
}