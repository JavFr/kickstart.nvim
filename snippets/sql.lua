local ls = require 'luasnip'

return {
  --snippet for disabled standar login
  ls.snippet('cli', {
    ls.text_node 'SET client_min_messages TO warning;',
  }, { desc = 'SET client_min_messages TO warning;' }),
  ls.snippet('pgtap', {
    ls.text_node { 'SET client_min_messages TO warning;', 'CREATE EXTENSION IF NOT EXISTS pgtap;', 'RESET client_min_messages;' },
  }, { desc = 'PGTAP' }),
}
