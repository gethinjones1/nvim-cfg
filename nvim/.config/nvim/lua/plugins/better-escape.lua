vim.pack.add { 'https://github.com/max397574/better-escape.nvim' }

require('better_escape').setup {
  default_mappings = false,
  timeout = vim.o.timeoutlen,
  mappings = {
    i = {
      j = { k = '<Esc>' },
      J = { K = '<Esc>' },
    },
  },
}
