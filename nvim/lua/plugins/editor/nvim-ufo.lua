return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        -- Require nvim-ufo and setup the configurations
        local ufo = require("ufo")
        vim.o.foldcolumn = "0" -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        -- Setup nvim-ufo with your preferences
        ufo.setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter"}
            end,
        })
    end,
}

