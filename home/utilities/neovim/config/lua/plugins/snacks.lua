local mk_map = require('helpers').mk_map

require('snacks').setup({
  image = {
      math = {
         enabled = false,
      },
  },

  picker = {},
})

mk_map('n', '<Leader>fp', function() Snacks.picker() end, 'Find files')
mk_map('n', '<Leader>ff', Snacks.picker.files, 'Find files')
mk_map('n', '<Leader>fg', Snacks.picker.git_files, 'Find Git files')
mk_map('n', '<Leader>fb', Snacks.picker.buffers, 'Find buffers')
mk_map('n', '<Leader>fs', Snacks.picker.grep, 'Find strings (grep)')
mk_map('n', '<Leader>fd', Snacks.picker.diagnostics, 'Find diagnostics')
mk_map('n', '<leader>fD', Snacks.picker.diagnostics_buffer, 'Buffer diagnostics')
mk_map('n', '<leader>fm', Snacks.picker.marks, 'Find marks')
