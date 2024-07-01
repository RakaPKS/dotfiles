-- UI---------------------------------------------------------------------------
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.termguicolors = true -- Enable true color support
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.cursorline = true -- Highlight current line
vim.opt.showmode = false -- Hide show as its already in status line

-- Indentation------------------------------------------------------------------
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.smartindent = true -- Auto indent new lines

-- Search-----------------------------------------------------------------------
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Unless you use capital letters
vim.opt.hlsearch = false -- Don't highlight all matches
vim.opt.incsearch = true -- Incremental search

-- Behavior---------------------------------------------------------------------
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.breakindent = true -- Wrapped lines keep indentation
vim.opt.undofile = true -- Persistent undo history
vim.opt.shortmess:append("c") -- Disable write prompt

-- External---------------------------------------------------------------------
vim.opt.autoread = true -- Automatically read changes

-- Toggle commandline-----------------------------------------------------------
vim.o.cmdheight = 0 -- Set cmdheight to 1 to show the command line

-- Create an autocmd to hide the command line
-- when leaving the command-line mode
vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = ":",
    callback = function()
        vim.o.cmdheight = 0
    end,
})
-- Create an autocmd to show the command line
-- when entering the command-line mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = ":",
    callback = function()
        vim.o.cmdheight = 1
    end,
})
----Neovide---------------------------------------------------------------------
if vim.g.neovide then
    vim.opt.guifont = { "MesloLGSDZ Nerd Font", ":h12" }
end

--------------------------------------------------------------------------------