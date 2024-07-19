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
vim.lsp.inlay_hint.enable(true) -- Enable Inlay Hints
vim.opt.updatetime = 1000 -- Lowers update time

-- Diagnostics------------------------------------------------------------------
vim.diagnostic.config({
    virtual_text = false,
})
local signs = {
    Error = "",
    Warn = "",
    Hint = " ",
    Info = ""
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- External---------------------------------------------------------------------
vim.opt.autoread = true -- Automatically read changes

-- Toggle commandline-----------------------------------------------------------
vim.o.cmdheight = 0 -- Set cmdheight to 1 to show the command line

-- Function to check if running on macOS
local function is_macos()
    return vim.loop.os_uname().sysname == "Darwin"
end

----Neovide---------------------------------------------------------------------
if vim.g.neovide then
    if is_macos() then
        vim.o.guifont = "Operator-caska,Hack Nerd Font Mono:h16"
    else
        vim.o.guifont = "Operator-caska,MesloLGSDZ Nerd Font:h13"
    end
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_scroll_animation_length = 0.3
end
--------------------------------------------------------------------------------
