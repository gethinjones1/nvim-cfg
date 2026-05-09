vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }

require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        text_align = 'left',
        separator = true,
      },
    },
  },
}
