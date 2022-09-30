local keymap = vim.keymap

-- Don't yank with x
keymap.set('n', 'x', '"_x')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New windows
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

--  Navigate window
keymap.set('n', '<Leader>w', '<C-w>w')
keymap.set('n', '<Leader>o', '<C-w>o')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Lazygit
keymap.set('n', '<Leader>g', ':FloatermNew --width=0.8 --height=0.8 lazygit<CR>')

-- TODO: Resize windows
