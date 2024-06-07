return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<C-Left>", "<Esc>:TmuxNavigateLeft<CR>" },
        { "<C-Down>", "<Esc>:TmuxNavigateDown<CR>" },
        { "<C-Up>", "<Esc>:TmuxNavigateUp<CR>" },
        { "<C-Right>", "<Esc>:TmuxNavigateRight<CR>" },
        { "<C-\\>", "<Esc>:TmuxNavigatePrevious<CR>" },
    },
}
