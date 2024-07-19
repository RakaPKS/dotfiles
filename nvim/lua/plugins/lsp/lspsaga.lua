return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                keys = {
                    quit = {'<Esc>', 'q'}
                }
            },
            diagnostic = {
                show_code_action = true,
                show_source = true,
                show_source = false,
                show_filename = false, 
                max_width = 0.7,
                text_hl_follow = false,
                border_follow = true,
                extend_relatedInformation = false,
                diagnostic_only_current = true,
            },
            
        })
            -- Set up the autocommand for automatic diagnostics
            local group = vim.api.nvim_create_augroup("Line Diagnostics", { clear = true })
            vim.api.nvim_create_autocmd("CursorHold", {
                command = "Lspsaga show_line_diagnostics ++unfocus",
                group = group,
            })
                
    end,
}
