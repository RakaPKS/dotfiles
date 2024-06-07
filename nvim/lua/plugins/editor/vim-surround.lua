return {
    -- vim-surround
    {
      "tpope/vim-surround",
      lazy = true,
      keys = {
        "as", -- Add surrounds
        "ds", -- Delete surrounds
        "cs", -- Change surrounds
      },
      config = function()
        -- Configure vim-surround options if needed
      end,
    },
  }