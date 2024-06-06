-- Helper function for keymaps
  local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end


-- Navigation
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>e", ":NvimTreeToggle<CR>")
-- Window management
map("n", "<leader>sv", ":sp<CR>")  -- Split vertically
map("n", "<leader>sh", ":vsp<CR>")  -- Split horizontally
map("n", "<C-h>", "<C-w>h", { noremap = true })        -- Move left
map("n", "<C-j>", "<C-w>j", { noremap = true })        -- Move down
map("n", "<C-k>", "<C-w>k", { noremap = true })        -- Move up
map("n", "<C-l>", "<C-w>l", { noremap = true })        -- Move right

-- Buffer navigation
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<S-l>", ":bnext<CR>")

-- Quick save and quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Neo-Tree
map("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
map("n", "<leader>bf", ":Neotree buffers reveal float<CR>")

-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- barbar

        -- Move to previous/next
        map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
        -- Re-order to previous/next
        map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
        map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
        -- Goto buffer in position...
        map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
        -- Close buffer
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
        -- Wipeout buffer
        --                 :BufferWipeout
        -- Close commands
        --                 :BufferCloseAllButCurrent
        --                 :BufferCloseAllButPinned
        --                 :BufferCloseAllButCurrentOrPinned
        --                 :BufferCloseBuffersLeft
        --                 :BufferCloseBuffersRight
        -- Magic buffer-picking mode
        map('n', '<C-S-p>', '<Cmd>BufferPick<CR>', opts)
        -- Sort automatically by...
        map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
        map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)