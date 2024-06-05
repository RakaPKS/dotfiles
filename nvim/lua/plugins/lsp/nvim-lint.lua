return {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
  
      lint.linters_by_ft = {
        python = {"flake8"},
        lua = {"selene"},
        -- Add more filetype-linter mappings as needed
      }
  
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  }