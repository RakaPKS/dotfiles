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
        keys = {
            { "<leader>d", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
            { "<leader>D", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
        },
        config = function()
            require("diffview").setup({
                -- Diffview.nvim configuration options
                enhanced_diff_hl = true, -- Enable enhanced highlighting for the diff view
                keymaps = {
                    -- Customize keymaps for diffview.nvim
                    disable_defaults = false, -- Disable default keymaps
                    view = {
                        ["<tab>"] = vim.cmd.goto_next_hunk, -- Go to the next hunk
                        ["<s-tab>"] = vim.cmd.goto_prev_hunk, -- Go to the previous hunk
                    },
                },
            })
        end,
    },
}
