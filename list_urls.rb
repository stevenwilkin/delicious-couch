#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'

server = CouchRest.new
db = server.database('delicious')

docs = db.view('links/urls')['rows']

docs.each do |doc|
  puts doc['id']
end
