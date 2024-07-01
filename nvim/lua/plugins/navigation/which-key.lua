return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 50
        require("which-key").setup({
            plugins = {
                marks = false,
                registers = false,
            },
            key_labels = {
                ["<space>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },
            window = {
                border = "single",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 2, 2, 2, 2 },
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 3,
                align = "center",
            },
            ignore_missing = false,
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
            show_help = true,
            triggers = "auto",
            triggers_blacklist = {
                i = { "j", "k" },
                v = { "j", "k" },
            },
            disable = {
                buftypes = {},
                filetypes = { "TelescopePrompt" },
            },
        })

        local opts = {
            mode = "n",
            prefix = "<leader>",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true,
        }

        local mappings = {
            ["e"] = "Toggle Neo-Tree",
            ["w"] = "Write",
            ["q"] = "Quit",
            ["/"] = "Comment Line",
            ["b"] = "Set Breakpoint",
            ["-"] = "Open Oil",
            ["f"] = {
                name = "Telescope",
                ["f"] = "Find Files",
                ["g"] = "Live Grep",
                ["b"] = "Buffers",
                ["h"] = "Help Tags",
                ["o"] = "Old Files",
            },
            ["g"] = {
                name = "Git",
                ["g"] = "Open Neogit",
                ["d"] = "Show Definition",
                ["r"] = "Show References",
                ["f"] = "Format Buffer with Conform",
            },
            ["h"] = {
                name = "Gitsigns",
                ["s"] = "Stage Hunk",
                ["u"] = "Undo Stage Hunk",
                ["S"] = "Stage Buffer",
                ["p"] = "Preview Hunk",
            },
            ["d"] = {
                name = "Diffview",
                ["o"] = "Open Diffview",
                ["c"] = "Close Diffview",
            },
            ["c"] = {
                name = "Code",
                ["a"] = "Code Action",
                ["o"] = "Open Quickfix",
                ["c"] = "Close Quickfix",
                ["n"] = "Next Quickfix Item",
                ["p"] = "Previous Quickfix Item",
            },
            ["l"] = {
                name = "Location",
                ["o"] = "Open Location List",
                ["c"] = "Close Location List",
                ["n"] = "Next Location List Item",
                ["p"] = "Previous Location List Item",
            },
            ["s"] = {
                name = "Split/Surround",
                ["v"] = "Split Vertically",
                ["h"] = "Split Horizontally",
                ["a"] = "Add Surrounding",
                ["d"] = "Delete Surrounding",
                ["f"] = "Find Surrounding (Right)",
                ["F"] = "Find Surrounding (Left)",
                ["s"] = "Highlight Surrounding",
                ["r"] = "Replace Surroudning",
                ["n"] = "Update N_lines",
            },
            ["t"] = {
                name = "Diagnostics/Tabs",
                ["n"] = "New Tab",
                ["c"] = "Close Tab",
                ["p"] = "Next Tab",
                ["o"] = "Previous Tab",
            },
            ["u"] = "Undo Tree",
            ["z"] = {
                name = "Folding",
                ["R"] = { "Open all folds" },
                ["M"] = { "Close all folds" },
                ["r"] = { "Open one level of folds" },
                ["m"] = { "Close one level of folds" },
                ["a"] = { "Toggle fold under cursor" },
                ["c"] = { "Close fold under cursor" },
                ["o"] = { "Open fold under cursor" },
            },
        }
        require("which-key").register(mappings, opts)
    end,
}
