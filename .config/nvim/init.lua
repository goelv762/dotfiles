vim.g.mapleader = ' '
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.cmdheight = 0
vim.keymap.set('n', '<Esc>', '<Esc>:nohlsearch<CR>')
vim.keymap.set('n', '<leader>r', ':update<CR> :make<CR>')
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F1>', '<Nop>', { noremap = true, silent = true })


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.frag", "*.vert" },
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})

require("config.lazy")
