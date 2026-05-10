vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

vim.keymap.set('n', '<leader><bar>', '<cmd>botright vnew<CR>', { desc = 'Splits a new buffer to right' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%:t')
  vim.notify 'Filename copied'
end, { desc = '[Y]ank [F]ilename' })

vim.keymap.set('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
  vim.notify 'Filename and path copied'
end, { desc = '[Y]ank [P]ath' })

vim.keymap.set('n', '<leader>bd', function()
  local buf = vim.api.nvim_get_current_buf()
  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.api.nvim_win_call(win, function()
      local alt = vim.fn.bufnr '#'
      if alt > 0 and vim.fn.buflisted(alt) == 1 then
        vim.cmd 'buffer #'
      else
        vim.cmd 'bnext'
      end
      if vim.api.nvim_win_get_buf(win) == buf then vim.cmd 'enew' end
    end)
  end
  vim.api.nvim_buf_delete(buf, {})
end, { desc = '[B]uffer [D]elete' })

for _, key in ipairs { '<Left>', '<Right>', '<Up>', '<Down>' } do
  vim.keymap.set({ 'n', 'v' }, key, '<Nop>', { silent = true })
end
