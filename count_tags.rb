#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'

server = CouchRest.new
db = server.database('delicious')

# fetch the view, triggering the reduce function
docs = db.view('links/tags', :group => true)['rows']

docs.each do |doc|
  puts "#{doc['key']}: #{doc['value']}"
end
