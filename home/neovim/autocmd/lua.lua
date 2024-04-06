-- Indentation - 4 spaces
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "lua" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end
})
