#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'couchrest'

# retrieve Basic Auth credentials for Delicious from environment variables
USER = ENV['USER']
PASS = ENV['PASS']

# start off with a fresh database
couch = CouchRest.new
couch.database('delicious').delete! rescue nil
db = couch.create_db('delicious')

# get XML from API
doc = Nokogiri::XML(`curl https://#{USER}:#{PASS}@api.del.icio.us/v1/posts/all`)

doc.xpath('//post').each do |post|

  # create a hash from each entry
  doc = {}
  ['href', 'description', 'tag', 'time', 'extended'].each do |field|
    doc[field] = post[field]
  end
  doc['_id'] = post['href'] # use bookmark url as document id
  doc['tag'] = post['tag'].split # array of tags

  # bung it in the couch
  db.save_doc(doc)
end
