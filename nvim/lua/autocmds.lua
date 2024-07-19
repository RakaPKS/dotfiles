vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        vim.lsp.buf.format({ timeout_ms = 200 })
    end,
})

vim.api.nvim_create_user_command("ReloadKeymaps", function()
    dofile(vim.fn.stdpath("config") .. "~.config/nvim/lua/keymaps.lua")
    print("Keymaps reloaded!")
end, {})

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

vim.api.nvim_create_user_command('ProjectAdd', function()
    local project_actions = require("telescope._extensions.project.actions")
    project_actions.add_project_cwd()
end, {})

vim.api.nvim_create_user_command('ProjectDelete', function()
    require('telescope').extensions.project.project({ action = "delete" })
end, {})

vim.api.nvim_create_user_command('ProjectRename', function()
    require('telescope').extensions.project.project({ action = "rename" })
end, {})
