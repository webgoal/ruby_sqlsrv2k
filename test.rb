#!/usr/bin/env ruby

require 'dbi'
db = DBI.connect('dbi:ODBC:PROJETO', 'projeto', 'senha')
select = db.prepare('SELECT nome FROM usuario')
select.execute
while rec = select.fetch do
  puts rec['nome']
end
db.disconnect
