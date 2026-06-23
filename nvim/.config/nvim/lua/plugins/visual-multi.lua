-- VM_maps must be set before plugin load
vim.g.VM_maps = {
  ['Find Under'] = '<C-n>',
  ['Find Subword Under'] = '<C-n>',
  ['Select All'] = '<C-a>',
  ['Skip'] = '<C-x>',
  ['Remove Region'] = '<C-p>',
  ['Add Cursor Down'] = '<C-d>',
  ['Add Cursor Up'] = '<C-u>',
}

vim.pack.add { 'https://github.com/mg979/vim-visual-multi' }
