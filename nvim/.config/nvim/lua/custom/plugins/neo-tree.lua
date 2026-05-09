vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
}

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false, -- show .env etc.
      hide_gitignored = true,
    },
    follow_current_file = { enabled = true },
  },
  window = { position = 'left', width = 30 },
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'File [E]xplorer' })
