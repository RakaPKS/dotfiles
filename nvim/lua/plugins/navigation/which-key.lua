return {
    "folke/which-key.nvim",
    version = "v2.1.0",
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
            ["y"] = "Redo",
            ["u"] = "Undo Tree",

            ["f"] = {
                name = "Telescope",
                ["f"] = "Find Files",
                ["g"] = "Live Grep",
                ["b"] = "Buffers",
                ["h"] = "Help Tags",
                ["o"] = "Old Files",
                ["d"] = "Diagnostics",
                ["p"] = "Projects",
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
                name = "Diffview/DAP",
                ["o"] = "Open Diffview",
                ["c"] = "Close Diffview",
                ["u"] = "Toggle DAP UI",
                ["e"] = "DAP Eval",
            },

            ["c"] = {
                name = "Code",
                ["a"] = "Code Action",
                ["o"] = "Open Quickfix",
                ["c"] = "Close Quickfix",
                ["n"] = "Next Quickfix Item",
                ["p"] = "Previous Quickfix Item",
                ["h"] = "Toggle Inlay Hints",
            },

            ["l"] = {
                name = "LSP",
                ["f"] = "Lspsaga Finder",
                ["o"] = "Lspsaga Outline",
                ["r"] = "Lspsaga Rename",
                ["d"] = "Lspsaga Diagnostic",
                ["s"] = "Document Symbols",
                ["w"] = "Workspace Symbols",
            },

            ["r"] = {
                name = "Refactor",
                ["e"] = "Extract Function",
                ["f"] = "Extract Function To File",
                ["v"] = "Extract Variable",
                ["i"] = "Inline Variable",
                ["b"] = "Extract Block",
                ["B"] = "Extract Block To File",
                ["r"] = "Select Refactor",
                ["p"] = "Debug Print",
                ["P"] = "Debug Print Variable",
                ["c"] = "Debug Cleanup",
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
                ["r"] = "Replace Surrounding",
                ["n"] = "Update N_lines",
            },

            ["t"] = {
                name = "Diagnostics/Tabs",
                ["n"] = "New Tab",
                ["c"] = "Close Tab",
                ["p"] = "Next Tab",
                ["o"] = "Previous Tab",
            },

            ["z"] = {
                name = "Folding/Zen Mode",
                ["R"] = "Open all folds",
                ["M"] = "Close all folds",
                ["r"] = "Open one level of folds",
                ["m"] = "Close one level of folds",
                ["a"] = "Toggle fold under cursor",
                ["c"] = "Close fold under cursor",
                ["o"] = "Open fold under cursor",
                ["z"] = "Toggle Zen Mode",
            },

            ["q"] = {
                name = "Persistence",
                ["s"] = "Load Current Dir Session",
                ["S"] = "Select Session",
                ["l"] = "Load Latest Session",
                ["d"] = "Stop Persistence",
            },

            ["T"] = {
                name = "Trouble",
                ["t"] = "Toggle Trouble",
                ["w"] = "Workspace Diagnostics",
                ["d"] = "Document Diagnostics",
                ["q"] = "Quickfix",
                ["l"] = "Loclist",
            },

            ["m"] = {
                name = "Mason",
                ["m"] = "Mason",
                ["l"] = "Mason Lspconfig",
            },

            ["C"] = {
                name = "Colorizer",
                ["t"] = "Toggle Colorizer",
                ["a"] = "Attach Colorizer",
            },

            ["i"] = {
                name = "Indent Blankline",
                ["t"] = "Toggle Indent Blankline",
            },

            ["L"] = {
                name = "Linting",
                ["l"] = "Lint",
            },

            ["P"] = {
                name = "Plugins",
                ["i"] = "Install Plugins",
                ["s"] = "Sync Plugins",
                ["S"] = "Status",
                ["u"] = "Update Plugins",
                ["p"] = "Profile",
            },

            ["A"] = {
                name = "Auto Pairs",
                ["t"] = "Toggle Auto Pairs",
            },
        }

        -- Add normal mode mappings
        local normal_mappings = {
            ["<A-Left>"] = "Previous Buffer",
            ["<A-Right>"] = "Next Buffer",
            ["<C-w>"] = "Close Buffer",
            ["<C-Up>"] = "Window Up",
            ["<C-Down>"] = "Window Down",
            ["<C-Left>"] = "Window Left",
            ["<C-Right>"] = "Window Right",
            ["<C-t>"] = "Open Floating Terminal",
            ["<F5>"] = "DAP Continue",
            ["<F10>"] = "DAP Step Over",
            ["<F11>"] = "DAP Step Into",
            ["<F12>"] = "DAP Step Out",
            ["K"] = "Hover Doc",
            ["[c"] = "Gitsigns Prev Hunk",
            ["]c"] = "Gitsigns Next Hunk",
        }

        require("which-key").register(mappings, opts)
        require("which-key").register(normal_mappings, { mode = "n" })
    end,
}