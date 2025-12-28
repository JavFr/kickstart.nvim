-- LuaSnip snippets for hledger journal files
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to get current year-month in YYYY-MM- format
local function get_current_date_prefix()
  return os.date '%Y-%m-'
end

return {
  -- Snippet for ARS expenses (Pesos Argentinos)
  s('exp', {
    f(get_current_date_prefix),
    i(1, 'DD'),
    t ' ',
    i(2, 'Description'),
    t { '', '    expenses:' },
    i(3, 'transport'),
    t '          ',
    i(4, 'amount'),
    t ',00 ARS',
    t { '', '    liabilities:' },
    i(5, 'visa:yo'),
    i(0),
  }),

  -- Snippet for USD expenses (Dólares)
  s('expd', {
    f(get_current_date_prefix),
    i(1, 'DD'),
    t ' ',
    i(2, 'Description'),
    t { '', '    expenses:' },
    i(3, 'gift'),
    t '          ',
    i(4, 'amount'),
    t '.00 USD',
    t { '', '    liabilities:' },
    i(5, 'amex:yo'),
    i(0),
  }),
}
