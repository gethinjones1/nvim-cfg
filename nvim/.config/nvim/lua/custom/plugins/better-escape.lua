vim.pack.add { 'https://github.com/max397574/better-escape.nvim' }

require('better_escape').setup {
  mappings = {
    i = {
      j = { k = '<Esc>' },
      J = { K = '<Esc>' },
    },
  },
}
