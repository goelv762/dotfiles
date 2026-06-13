vim.g.mapleader = ' '
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.cmdheight = 0

-- stupid arduino stuff
vim.api.nvim_create_autocmd("FileType", {
    pattern = "arduino",
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
    end,
})
