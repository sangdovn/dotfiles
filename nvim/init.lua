vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Config
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.commands")

-- Plugins
require("plugins.ui.colorscheme")
require("plugins.ui.icons")
require("plugins.ui.lualine")
require("plugins.ui.bufferline")
require("plugins.ui.indent-blankline")
require("plugins.ui.fidget")

require("plugins.editor.fzf-lua")
require("plugins.editor.nvim-tree")
require("plugins.editor.tmux-navigator")
require("plugins.editor.mini-bufremove")
require("plugins.editor.mini-move")

require("plugins.coding.treesitter")
require("plugins.coding.blink")
require("plugins.coding.conform")
require("plugins.coding.ts-autotag")
require("plugins.coding.mini-pairs")

require("plugins.lsp")
require("plugins.git")
