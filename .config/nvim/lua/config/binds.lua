vim.keymap.set('n', '<Esc>', '<Esc>:nohlsearch<CR>')
vim.keymap.set('n', '<leader>r', ':update<CR> :make<CR>')
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F1>', '<Nop>', { noremap = true, silent = true })

vim.keymap.set("i", "<C-j>", "<C-n>")
vim.keymap.set("i", "<C-k>", "<C-p>")

