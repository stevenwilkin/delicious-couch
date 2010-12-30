#!/usr/bin/env ruby

require 'rubygems'
require 'couchrest'

server = CouchRest.new
db = server.database('delicious')

# delete design doc if it already exists
db.delete_doc db.get('_design/links') rescue nil

# save design doc containing views
db.save_doc({
  '_id' => '_design/links',
  :views => {
    :urls => {
      :map => '
        function(doc) {
          emit(doc._id, null);
        }
      '
    },
    :tags => {
      :map => '
        function(doc) {
        	doc.tag.forEach(function(tag) {
        		emit(tag, 1);
        	});
        }
      ',
      :reduce => '
        function(keys, values) {
        	return sum(values);	
        }
      '
    }
  }
})
