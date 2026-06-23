vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/catppuccin/nvim',
}

local mocha = require('catppuccin.palettes').get_palette('mocha')

require('bufferline').setup{
  highlights = require('catppuccin.special.bufferline').get_theme {
    custom = {
      all = {
        fill = { bg = mocha.mantle },
      },
    },
  },
  options = {
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'snacks_layout_box',
      },
    },
  },
} 

vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
