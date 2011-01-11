# Delicious Couch

A few Ruby scripts to backup Delicious bookmarks to CouchDB and provide some simple queries


# Prerequisites

* a pre-Yahoo Delicious account as they use HTTP Basic Auth for authentication
* CouchDB running on port 5984 on your local machine, I recommend the binary distributions from [CouchOne](http://www.couchone.com/get)
* nokogiri and couchrest gems must be installed

		sudo gem install nokogiri couchrest



# Clone the code from GitHub

	git clone https://github.com/stevenwilkin/delicious-couch
	cd delicious-couch



# Run the import script to fetch your saved bookmarks

Substitute your username and password on the command line

	USER=username PASS=password ./import.rb



# Create the design document

	./views.rb



# Querying the documents

Now that the database had been populated and the views created, the contents can be queried


## View all urls

	./list_urls.rb


## View all tags along with their count

	./count_tags.rb


## View all urls with a specific tag

	./urls_by_tag.rb git

Views all bookmarks tagged with "git"

This set of scripts is only scraping the surface of what is possible with CouchDB but it demonstrates the immense power of MapReduce along with the basics interacting with CouchDB using Ruby. Enjoy!

 
2010 [Steven Wilkin](http://twitter.com/stevebiscuit)
