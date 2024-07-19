return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope-project.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    project ={            
                        hidden_files = true,
                        order_by = "asc",
                        search_by = "title",
                    },
                },
                pickers = {
                    lsp_references = { theme = "dropdown" },
                    lsp_definitions = { theme = "dropdown" },
                    lsp_implementations = { theme = "dropdown" },
                },
            })
            telescope.load_extension("ui-select")
            telescope.load_extension("fzf")
            telescope.load_extension("project")
        end,
    },
}