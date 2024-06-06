return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Set up debug adapters
            dap.adapters.python = {
                type = "executable",
                command = "/usr/bin/python",
                args = { "-m", "debugpy.adapter" },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return "/usr/bin/python"
                    end,
                },
            }

            dap.adapters.rust = {
                type = 'executable',
                attach = {
                    pidProperty = "pid",
                    pidSelect = "ask"
                },
                command = 'lldb',
                env = {
                    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
                },
                name = "lldb"
            }
    
            dap.configurations.rust = {
                {
                    type = "rust",
                    request = "launch",
                    name = "Launch file",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = true,
                },
            }    
    

            -- Set up nvim-dap-ui
            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸" },
                mappings = {
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                },
                sidebar = {
                    elements = {
                        { id = "scopes", size = 0.25 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks", size = 0.25 },
                        { id = "watches", size = 0.25 },
                    },
                    size = 40,
                    position = "left",
                },
                tray = {
                    elements = { "repl" },
                    size = 10,
                    position = "bottom",
                },
                floating = {
                    max_height = nil,
                    max_width = nil,
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
            })

            -- Set up keybindings
            vim.keymap.set("n", "<F5>", dap.continue, { silent = true })
            vim.keymap.set("n", "<F10>", dap.step_over, { silent = true })
            vim.keymap.set("n", "<F11>", dap.step_into, { silent = true })
            vim.keymap.set("n", "<F12>", dap.step_out, { silent = true })
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { silent = true })
            vim.keymap.set("n", "<leader>du", dapui.toggle, { silent = true })
            vim.keymap.set("n", "<leader>de", dapui.eval, { silent = true })

            -- Set up listeners for nvim-dap-ui
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            -- Customize breakpoint appearance
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "ErrorMsg", linehl = "", numhl = "" })
        end,
    },
}
