local mk_map = require('helpers').mk_map

mk_map('n', '<C-d>', '<C-d>zz', 'Scroll Down')
mk_map('n', '<C-u>', '<C-u>zz', 'Scroll Up')
mk_map('n', 'n', 'nzzzv', 'Next Search Result')
mk_map('n', 'N', 'Nzzzv', 'Previous Search Result')

mk_map('n', '<Leader>os', function() vim.o.spell = not(vim.o.spell) end, 'Toggle spellcheck')
mk_map('n', '<Leader>ow', function() vim.o.wrap = not(vim.o.wrap) end, 'Toggle wrap')
mk_map('i', '<C-b>', '<C-g>u<Esc>[s1z=`]a<C-g>u', 'Correct last spelling error')
mk_map({'n', 'i', 'c'}, '<C-l>', '<Enter>', 'Enter')

-- Splits are handled with alt
mk_map('n', '<M-v>', '<cmd>vsplit<Enter>', 'New vsplit')
mk_map('n', '<M-s>', '<cmd>split<Enter>', 'New hsplit')
mk_map('n', '<M-k>', '<C-w>k', 'Move up a split')
mk_map('n', '<M-j>', '<C-w>j', 'Move down a split')
mk_map('n', '<M-l>', '<C-w>l', 'Move right a split')
mk_map('n', '<M-h>', '<C-w>h', 'Move left a split')
mk_map('n', '<M-K>', '<C-w>+', 'Increase split size vertically')
mk_map('n', '<M-J>', '<C-w>-', 'Decrease split size vertically')
mk_map('n', '<M-L>', '<C-w>>', 'Increase split size horizontally')
mk_map('n', '<M-H>', '<C-w><', 'Decrease split size horizontally')
mk_map('n', '<M-x>', '<C-w>x', 'Swap splits')
