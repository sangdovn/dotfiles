vim.pack.add({
    -- Git signs/hunks
    "https://github.com/lewis6991/gitsigns.nvim",

    -- Git interface
    "https://github.com/NeogitOrg/neogit",
})

-- Gitsigns
require("gitsigns").setup({
    signs = {
        add = { text = "󰐕" },
        change = { text = "󰏫" },
        delete = { text = "󰍵" },
    },
})

-- Neogit
require("neogit").setup({ kind = "replace" })

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })
