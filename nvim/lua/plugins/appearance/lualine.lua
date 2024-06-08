return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
      local solarized_ok, solarized = pcall(require, "solarized")
  
      local lualine_options = {
        options = {
          disabled_filetypes = { "neo-tree" },
        },
      }
  
      if catppuccin_ok then
        lualine_options.options.theme = "catppuccin-macchiato"
      elseif solarized_ok then
        lualine_options.options.theme = "solarized"
      else
        -- Set a default theme or provide a fallback
        lualine_options.options.theme = "auto"
      end
  
      require("lualine").setup(lualine_options)
    end,
  }