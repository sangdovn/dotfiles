local function map(mode, lhs, rhs, desc, opts)
    opts = vim.tbl_extend("force", {
        silent = true,
        desc = desc,
    }, opts or {})

    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Windows
map("n", "<leader>sv", "<C-w>v", "Split window vertically")
map("n", "<leader>sh", "<C-w>h", "Split window horizontally")
map("n", "<leader>se", "<C-w>=", "Make split equals size")
map("n", "<leader>sx", "<cmd>close<cr>", "Close current split")

-- Buffers
-- map("n", "<leader>x", "<cmd>bdelete<cr>", "Delete buffer")
map("n", "<leader>w", "<cmd>w<cr>", "Save file")
map("n", "<leader>q", "<cmd>q<cr>", "Quit")
map("n", "<leader>Q", "<cmd>q!<cr>", "Force quit")

-- Shift text
-- map("v", "J", ":m '>+1<CR>gv=gv", "Move text down")
-- map("v", "K", ":m '<-2<CR>gv=gv", "Move text up")
-- map("v", "<", "<gv", "Indent left")
-- map("v", ">", ">gv", "Indent right")

-- Paste
map("x", "p", "P", "Paste without yanking")

-- Preserve register
map({ "n", "x" }, "c", '"_c', "Change without yanking")
map({ "n", "x" }, "C", '"_C', "Change line without yanking")

-- Centered navigation
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")
map("n", "n", "nzzzv", "Next search result")
map("n", "N", "Nzzzv", "Previous search result")

-- Utilities
map("i", "jk", "<Esc>", "Exit insert mode")
map("n", ";", ":", "Enter command mode")
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search")
map("n", "<C-s>", "<cmd>w<cr>", "Save file")
map("i", "<C-s>", "<cmd>w<cr><Esc>", "Save file")
map("n", "<C-a>", "ggVG", "Select all")

-- Mouse scrolling
map({ "n", "v" }, "<ScrollWheelUp>", "<C-y>", "Scroll up")
map({ "n", "v" }, "<ScrollWheelDown>", "<C-e>", "Scroll down")
map({ "n", "v" }, "<S-ScrollWheelLeft>", "zh", "Scroll left")
map({ "n", "v" }, "<S-ScrollWheelRight>", "zl", "Scroll right")

-- Diagnostics
map("n", "gl", vim.diagnostic.open_float, "Show diagnostic")
map("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
end, "Previous diagnostic")

map("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
end, "Next diagnostic")
