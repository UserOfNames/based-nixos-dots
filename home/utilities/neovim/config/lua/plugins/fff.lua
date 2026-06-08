local mk_map = require('helpers').mk_map
local fff = require('fff')

mk_map('n', '<Leader>ff', fff.find_files, 'Find files')
mk_map('n', '<Leader>fs', fff.live_grep, 'Live grep')
mk_map('n', '<Leader>fmr', fff.scan_files, 'Refresh fff file scan')
mk_map('n', '<Leader>fmg', fff.refresh_git_status, 'Refresh fff git status')

-- TODO: Potentially add per-directory search and/or change CWD
