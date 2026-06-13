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

vim.lsp.config('arduino_language_server', {
    cmd = {
        'arduino-language-server',
        '-cli', 'arduino-cli',
        '-clangd', 'clangd',
        '-fqbn', 'arduino:avr:uno',
    },
})

vim.lsp.enable({
	'lua_ls',
	'clangd',
	'arduino_language_server'
})

