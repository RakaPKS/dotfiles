vim.api.nvim_create_user_command("ProjectAdd", function()
    local project_actions = require("telescope._extensions.project.actions")
    project_actions.add_project_cwd()
end, {})

vim.api.nvim_create_user_command("ProjectDelete", function()
    require("telescope").extensions.project.project({ action = "delete" })
end, {})

vim.api.nvim_create_user_command("ProjectRename", function()
    require("telescope").extensions.project.project({ action = "rename" })
end, {})

vim.api.nvim_create_user_command("PrintPlugins", function()
    local plugins = require("lazy").plugins()
    for _, plugin in ipairs(plugins) do
        print(plugin[1])
    end
end, {})

vim.api.nvim_create_user_command("PrintPluginsToFile", function()
    local plugins = require("lazy").plugins()
    local file_path = vim.fn.expand("~/lazy_plugins_list.txt")
    local file = io.open(file_path, "w")

    if file then
        for _, plugin in ipairs(plugins) do
            file:write(plugin[1] .. "\n")
        end
        file:close()
        print("Plugin list written to: " .. file_path)
    else
        print("Failed to open file for writing")
    end
end, {})
