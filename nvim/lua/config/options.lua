local o = vim.opt

-- UI
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.colorcolumn = "80,100,120"
o.winborder = "rounded"
o.list = true -- show invisible characters
o.listchars = {
    tab = "»·", -- tabs
    lead = "·", -- leading spaces
    -- trail = "·", -- trailing spaces
    -- eol = "↴", -- end-of-line marker
    nbsp = "␣", -- non-breaking spaces
}

-- Indent
o.tabstop = 2 -- a Tab looks like 2 spaces
o.shiftwidth = 2 -- indents by 2 spaces
o.expandtab = true -- pressing Tab inserts spaces, not \t
o.smartindent = true -- Neovim automatically adds indentation for code

-- Editing
o.clipboard = "unnamedplus"
o.backspace = { "indent", "eol", "start" }

-- Text
o.wrap = false
o.scrolloff = 10
o.sidescrolloff = 10

-- Search
o.ignorecase = true
o.smartcase = true

-- Timing
o.updatetime = 250 -- how long Neovim waits before doing background updates
o.timeoutlen = 300 -- how long Neovim waits for the next key in a key sequence

-- Files
o.swapfile = false
o.backup = false
o.autoread = true

-- Undo
local undodir = vim.fn.stdpath("data") .. "/undodir"

if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p") -- create the directory if missing
end
o.undodir = undodir -- location for undo history files
o.undofile = true -- save undo history

-- Views / folds
local viewdir = vim.fn.stdpath("state") .. "/view"

if vim.fn.isdirectory(viewdir) == 0 then
    vim.fn.mkdir(viewdir, "p")
end

o.viewdir = viewdir
o.viewoptions = { "folds", "cursor" }
