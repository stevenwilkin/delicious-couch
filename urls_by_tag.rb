#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'

unless ARGV.length == 1
  puts "Usage: #{$0} <TAG>"
  exit
end

server = CouchRest.new
db = server.database('delicious')

docs = db.view('links/by_tag', :key => ARGV[0])['rows']

docs.each do |doc|
  puts doc['id']
end
