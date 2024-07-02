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

-- Location
vim.keymap.set("n", "<Leader>lo", ":lopen<CR>", opts, { desc = "Open Location List" })
vim.keymap.set("n", "<Leader>lc", ":lclose<CR>", opts, { desc = "Close Location List" })
vim.keymap.set("n", "<Leader>ln", ":lnext<CR>", opts, { desc = "Next Location List Item" })
vim.keymap.set("n", "<Leader>lp", ":lprevious<CR>", opts, { desc = "Previous Location List Item" })

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
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", opts, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<CR>", opts, { desc = "Telescope Help Tags" })
vim.keymap.set("n", "<Leader>fo", ":Telescope oldfiles<CR>", opts, { desc = "Telescope Old Files" })

-- Neo-tree
vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", opts, { desc = "Toggle Neo-Tree" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "Hover" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts, { desc = "Show Defenition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts, { desc = "Show References" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "Code Action" })

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
vim.keymap.set("n", "<Leader>/", ":Commentary<CR>", opts, { desc = "Comment Line" })
vim.keymap.set("v", "<Leader>/", ":Commentary<CR>", opts, { desc = "Comment Line" })
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts, { desc = "Write" })
vim.keymap.set("n", "<Leader>q", ":q<CR>", opts, { desc = "Quit" })

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
vim.keymap.set('n', '<C-=>', function() change_font_size(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-+>', function() change_font_size(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-->', function() change_font_size(-1) end, { noremap = true, silent = true })
