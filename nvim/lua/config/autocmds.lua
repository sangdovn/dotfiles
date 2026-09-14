-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Enable word wrapping for Markdown and text files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

local function is_real_file(buf)
    return vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
end

-- Save view when leaving a window
vim.api.nvim_create_autocmd("BufWinLeave", {
    callback = function(args)
        if is_real_file(args.buf) then
            vim.cmd("silent! mkview")
        end
    end,
})

-- Restore view when entering a window
vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function(args)
        if is_real_file(args.buf) then
            vim.cmd("silent! loadview")
        end
    end,
})
