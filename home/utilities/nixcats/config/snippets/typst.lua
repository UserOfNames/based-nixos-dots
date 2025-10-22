local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
   s('unbreakable', fmt(
      [[
         #block(breakable: false)[
            {}
         ]
      ]], {
         i(1),
      }
   )),

   s('center', fmt(
      [[
         #align(center)[
            {}
         ]
      ]], {
         i(1),
      }
   )),
}
