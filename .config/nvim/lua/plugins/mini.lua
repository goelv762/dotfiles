vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})

-- default config
require('mini.basics').setup()
-- provides icons for others
require('mini.icons').setup()
-- bracket / quotation pairing
require('mini.pairs').setup()
-- auto cmp
require('mini.completion').setup()
-- finding stuff
require('mini.surround').setup()
-- snippets
require('mini.snippets').setup({
  expand = {
    insert = function(snippet, _)
      vim.snippet.expand(snippet.body)
    end,
  },
})

local jump_next = function()
	if vim.snippet.active({ direction = 1 }) then
		vim.snippet.jump(1)
	end
end

local jump_prev = function()
	if vim.snippet.active({ direction = -1 }) then
		vim.snippet.jump(-1)
	end
end

vim.keymap.set({ 'i', 's' }, '<C-l>', jump_next)
vim.keymap.set({ 'i', 's' }, '<C-h>', jump_prev)
