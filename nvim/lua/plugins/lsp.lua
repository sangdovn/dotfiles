vim.pack.add({
    -- LSP/tool installer
    "https://github.com/mason-org/mason.nvim",

    -- Mason <-> LSP integration
    "https://github.com/mason-org/mason-lspconfig.nvim",

    -- Installer formatters/LSPs/linters/etc.
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

    -- LSP configurations
    "https://github.com/neovim/nvim-lspconfig",

    -- Better Lua/Neovim development environment
    "https://github.com/folke/lazydev.nvim",
})

-- Mason
require("mason").setup()

-- Mason LSP config
require("mason-lspconfig").setup()

-- Mason Tool Installer
require("mason-tool-installer").setup({
    ensure_installed = {
        -- LSP
        "html",
        "cssls",
        "ts_ls",
        "tailwindcss",
        "ty",
        "ruff",
        "lua_ls",
        "jsonls",
        "yamlls",
        "dockerls",
        "bashls",

        -- Formatters / Linters
        "stylua",
        "biome",
    },
})

-- LSP
local lsp_attach = vim.api.nvim_create_augroup("UserLspAttach", {
    clear = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_attach,

    callback = function(ev)
        local buf = ev.buf

        local function map(lhs, rhs, desc, mode, opts)
            mode = mode or "n"

            opts = vim.tbl_extend("force", {
                buffer = buf,
                silent = true,
                desc = desc,
            }, opts or {})

            vim.keymap.set(mode, lhs, rhs, opts)
        end

        map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
        map("<leader>rn", vim.lsp.buf.rename, "Rename")

        -- Disable Ruff hover and code actions to avoid duplicate LSP actions.
        local client = vim.lsp.get_clients({ id = ev.data.client_id })[1]

        if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.codeActionProvider = false
        end

        if not client or not client:supports_method("textDocument/documentHighlight") then
            return
        end

        local highlight_group = vim.api.nvim_create_augroup("UserLspHighlight", { clear = false })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = buf,
            group = highlight_group,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = buf,
            group = highlight_group,
            callback = vim.lsp.buf.clear_references,
        })
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})

-- Lazy Dev
require("lazydev").setup()
