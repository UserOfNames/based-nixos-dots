-- mini.move: Move blocks of text
require('mini.move').setup({
   mappings = {
      left = 'H',
      right = 'L',
      down = 'J',
      up = 'K',

      line_left = '',
      line_right = '',
      line_down = '',
      line_up = '',
   }
})

-- mini.pairs: Autopairing
require('mini.pairs').setup()

-- mini.surround: Manage brackets/quotes/etc.
require('mini.surround').setup()
