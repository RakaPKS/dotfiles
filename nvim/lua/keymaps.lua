local opts = { noremap = true, silent = true }

-- Buffer navigation
vim.keymap.set("n", "<A-Left>", ":bprevious<CR>", opts, { desc = "Previous Buffer" })
vim.keymap.set("n", "<A-Right>", ":bnext<CR>", opts, { desc = "Next Buffer" })
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", opts, { desc = "Close Buffer" })

-- Window navigation
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>", opts, { desc = "Window Up" })
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>", opts, { desc = "Window Down" })
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", opts, { desc = "Window Left" })
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", opts, { desc = "Window Right" })

-- Window management
vim.keymap.set("n", "<leader>sv", ":sp<CR>", opts, { desc = "Split Vertically" }) -- Split vertically
vim.keymap.set("n", "<leader>sh", ":vsp<CR>", opts, { desc = "Split Horizontally" }) -- Split horizontally

-- Redo
vim.keymap.set("n", "<leader>y", ":redo<CR>", opts, { desc = "Redo" })

-- Manage Tabs
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>", opts, { desc = "New Tab" })
vim.keymap.set("n", "<Leader>tc", ":tabclose<CR>", opts, { desc = "Close Tab" })
vim.keymap.set("n", "<Leader>tp", ":tabnext<CR>", opts, { desc = "Next Tab" })
vim.keymap.set("n", "<Leader>to", ":tabprevious<CR>", opts, { desc = "Previous Tab" })

-- Quickfix
vim.keymap.set("n", "<Leader>co", ":copen<CR>", opts, { desc = "Open Quickfix" })
vim.keymap.set("n", "<Leader>cc", ":cclose<CR>", opts, { desc = "Close Quickfix" })
vim.keymap.set("n", "<Leader>cn", ":cnext<CR>", opts, { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<Leader>cp", ":cprevious<CR>", opts, { desc = "Previous Quickfix Item" })

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Tmux Navigator
vim.api.nvim_set_keymap("n", "<C-Left>", "<Esc>:TmuxNavigateLeft<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", "<Esc>:TmuxNavigateDown<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Up>", "<Esc>:TmuxNavigateUp<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", "<Esc>:TmuxNavigateRight<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-\\>", "<Esc>:TmuxNavigatePrevious<CR>", opts)

-- Telescope
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", opts, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", opts, { desc = "Telescope Live Grep" })
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", opts, { desc = "Telescope Diagnostics" })
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", opts, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<CR>", opts, { desc = "Telescope Help Tags" })
vim.keymap.set("n", "<Leader>fo", ":Telescope oldfiles<CR>", opts, { desc = "Telescope Old Files" })
vim.keymap.set('n', '<leader>fp', ":Telescope project<CR>",  opts, { desc = " Telescope Project" })

-- Neo-tree
vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", opts, { desc = "Toggle Neo-Tree" })

-- LSP
local builtin = require("telescope.builtin")
local saga = require("lspsaga")

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts, { desc = "Hover" })
vim.keymap.set("n", "gr", builtin.lsp_references, opts, { desc = "Find references" })
vim.keymap.set("n", "gd", builtin.lsp_definitions, opts, { desc = "Go to definition" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, opts, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, opts, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>lw", builtin.lsp_dynamic_workspace_symbols, opts, { desc = "Workspace symbols" })

-- Toggle Inlay Hints
local function toggle_inlay_hints()
    local enabled = vim.lsp.inlay_hint.is_enabled()
    if enabled then
        vim.lsp.inlay_hint.enable(false)
    else
        vim.lsp.inlay_hint.enable(true)
    end
end

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts, { desc = "Code Action" })
vim.keymap.set("n", "<leader>ch", toggle_inlay_hints, opts, {desc = "Toggle Inlay hints"})
vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", opts, { desc = "Lspsaga Finder" })
vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts, { desc = "Lspsaga Outline" })
vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", opts, { desc = "Lspsaga Rename" })
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts, {desc = "Next Diagnostic"})

-- Nvim-dap
vim.keymap.set("n", "<F5>", ':lua require("dap").continue()<CR>', opts, { desc = "DAP Continue" })
vim.keymap.set("n", "<F10>", ':lua require("dap").step_over()<CR>', opts, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", ':lua require("dap").step_into()<CR>', opts, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", ':lua require("dap").step_out()<CR>', opts, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>b", ':lua require("dap").toggle_breakpoint()<CR>', opts, { desc = "Set breakpoint" })

local dapui = require("dapui")
vim.keymap.set("n", "<leader>du", dapui.toggle, opts, { desc = "Toggle DAP-UI" })
vim.keymap.set("n", "<leader>de", dapui.eval, opts, { desc = "DAP-UI Eval" })

-- Oil
vim.keymap.set("n", "-", ":Oil<CR>", opts, { desc = "Open Oil" })

-- Nvim-toggleterm
vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", opts, { desc = "Open Floating Terminal" })

-- Gitsigns
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<CR>", opts, { desc = "Gitsigns Prev Hunk" })
vim.keymap.set("n", "]c", ":Gitsigns next_hunk<CR>", opts, { desc = "Gitsigns Next Hunk" })
vim.keymap.set("n", "<Leader>hs", ":Gitsigns stage_hunk<CR>", opts, { desc = "Gitsigns Stage Hunk" })
vim.keymap.set("n", "<Leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts, { desc = "Gitsigns Undo Stage Hunk" })
vim.keymap.set("n", "<Leader>hS", ":Gitsigns stage_buffer<CR>", opts, { desc = "Gitsigns Stage Buffer" })
vim.keymap.set("n", "<Leader>hp", ":Gitsigns preview_hunk<CR>", opts, { desc = "Gitsigns Preview Hunk" })

-- Neogit
vim.keymap.set("n", "<Leader>gg", ":Neogit<CR>", opts, { desc = "Open Neogit" })

-- Trouble
vim.keymap.set("n", "<leader>Tt", "<cmd>TroubleToggle<cr>", opts, { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>Tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts, { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>Td", "<cmd>TroubleToggle document_diagnostics<cr>", opts, { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>Tq", "<cmd>TroubleToggle quickfix<cr>", opts, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>Tl", "<cmd>TroubleToggle loclist<cr>", opts, { desc = "Loclist" })

-- Mason
vim.keymap.set("n", "<leader>mm", "<cmd>Mason<cr>", opts, { desc = "Open Mason" })
vim.keymap.set("n", "<leader>ml", "<cmd>MasonLog<cr>", opts, { desc = "Mason Log" })

-- Colorizer
vim.keymap.set("n", "<leader>Ct", "<cmd>ColorizerToggle<cr>", opts, { desc = "Toggle Colorizer" })
vim.keymap.set("n", "<leader>Ca", "<cmd>ColorizerAttachToBuffer<cr>", opts, { desc = "Attach Colorizer" })

-- Indent Blankline
vim.keymap.set("n", "<leader>it", "<cmd>IndentBlanklineToggle<cr>", opts, { desc = "Toggle Indent Blankline" })

-- Linting
vim.keymap.set("n", "<leader>Ll", function() require("lint").try_lint() end, opts, { desc = "Lint" })

-- Plugins (Lazy)
vim.keymap.set("n", "<leader>Pi", "<cmd>Lazy install<cr>", opts, { desc = "Install Plugins" })
vim.keymap.set("n", "<leader>Ps", "<cmd>Lazy sync<cr>", opts, { desc = "Sync Plugins" })
vim.keymap.set("n", "<leader>PS", "<cmd>Lazy show<cr>", opts, { desc = "Plugin Status" })
vim.keymap.set("n", "<leader>Pu", "<cmd>Lazy update<cr>", opts, { desc = "Update Plugins" })
vim.keymap.set("n", "<leader>Pp", "<cmd>Lazy profile<cr>", opts, { desc = "Plugin Profile" })

-- Auto Pairs
vim.keymap.set("n", "<leader>At", "<cmd>lua require('nvim-autopairs').toggle()<cr>", opts, { desc = "Toggle Auto Pairs" })

-- Zen Mode
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>", opts, { desc = "Toggle Zen Mode" })

-- Persistence (Session Management)
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, opts, { desc = "Load Current Dir Session" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, opts, { desc = "Select Session" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, opts, { desc = "Load Latest Session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, opts, { desc = "Stop Persistence" })


-- Diffview
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", opts, { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", opts, { desc = "Close Diffview" })
local diffview = require("diffview")
-- Check if the current buffer is Diffview
local is_diffview_buffer = function()
    local status_ok, _ = pcall(diffview.current_rev)
    return status_ok
end
vim.keymap.set("n", "<tab>", function()
    if is_diffview_buffer() then
        diffview.goto_next_hunk()
    end
end, opts, { desc = "Go to the next hunk" })
vim.keymap.set("n", "<s-tab>", function()
    if is_diffview_buffer() then
        diffview.goto_prev_hunk()
    end
end, opts, { desc = "Go to the previous hunk" })

-- Conform Format
vim.keymap.set("n", "<leader>gf", function()
    require("conform").format({ bufnr = 0 })
end, opts, { desc = "Format current buffer with conform.nvim" })

-- Misc
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts, { desc = "Write" })

-- Toggle comment on current line or selection
vim.keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, opts, { desc = "Toggle comment" })
vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts, { desc = "Toggle comment" })


-- Function to change font size
local function change_font_size(delta)
    local fonts = vim.opt.guifont:get()
    local updated_fonts = {}

    for _, font in ipairs(fonts) do
        local font_name, font_size = font:match("(.+):h(%d+)")
        if font_name and font_size then
            local new_size = math.max(1, tonumber(font_size) + delta)
            table.insert(updated_fonts, string.format("%s:h%d", font_name, new_size))
        else
            -- If the font doesn't match the expected format, keep it unchanged
            table.insert(updated_fonts, font)
        end
    end

    vim.opt.guifont = updated_fonts
end

-- Keybindings for font size adjustment
vim.keymap.set("n", "<C-=>", function()
    change_font_size(1)
end, opts)
vim.keymap.set("n", "<C-+>", function()
    change_font_size(1)
end, opts)
vim.keymap.set("n", "<C-->", function()
    change_font_size(-1)
end, opts)

--Refactoring.nvim
local refactoring = require("refactoring")
-- Remaps for the refactoring operations
vim.keymap.set("x", "<leader>re", function()
    refactoring.refactor("Extract Function")
end, { noremap = true, silent = true, expr = false })
vim.keymap.set("x", "<leader>rf", function()
    refactoring.refactor("Extract Function To File")
end, { noremap = true, silent = true, expr = false })
vim.keymap.set("x", "<leader>rv", function()
    refactoring.refactor("Extract Variable")
end, { noremap = true, silent = true, expr = false })
vim.keymap.set("n", "<leader>ri", function()
    refactoring.refactor("Inline Variable")
end, { noremap = true, silent = true, expr = false })
-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.keymap.set("n", "<leader>rb", function()
    refactoring.refactor("Extract Block")
end, { noremap = true, silent = true, expr = false })
-- Prompt for a refactor to apply when the remap is triggered
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
    refactoring.select_refactor()
end, { noremap = true, silent = true, expr = false })
-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set("n", "<leader>rp", function()
    refactoring.debug.printf({ below = false })
end, { noremap = true, silent = true, expr = false })
-- Print var
vim.keymap.set("n", "<leader>rv", function()
    refactoring.debug.print_var()
end, { noremap = true, silent = true, expr = false })
-- Cleanup function: Remove all debugging functions in a file
vim.keymap.set("n", "<leader>rc", function()
    refactoring.debug.cleanup({})
end, { noremap = true, silent = true, expr = false })
