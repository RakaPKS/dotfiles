-- UI
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.cursorline = true -- Highlight current line
vim.opt.showmode = false -- Hide show as its already in status line

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.smartindent = true -- Auto indent new lines

-- Search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Unless you use capital letters
vim.opt.hlsearch = false -- Don't highlight all matches
vim.opt.incsearch = true -- Incremental search

-- Behavior
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.breakindent = true -- Wrapped lines keep indentation
vim.opt.undofile = true -- Persistent undo history
