vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/sainnhe/gruvbox-material.git'
})

-- colourscheme
vim.g.gruvbox_material_background = "medium"
vim.cmd.colorscheme("gruvbox-material")

-- icons
require("nvim-web-devicons").setup({})
