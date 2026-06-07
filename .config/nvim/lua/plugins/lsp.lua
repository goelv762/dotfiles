vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
})

-- prevents includes
vim.lsp.config('clangd', {
    cmd = {
        'clangd',
        '--header-insertion=never',
    },
})

vim.lsp.enable({
	'lua_ls',
	'clangd'
})

