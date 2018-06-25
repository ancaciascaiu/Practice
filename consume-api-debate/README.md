# README

This application gets requests with the name of the page on www.debate.org/opinions in the url params. It then uses HttParty gem to make an external call to the above mentioned api and parses the response using Nokogiri gem to print:
- the opinion title
- the yes/no percentage
- the comments and authors for each side of the opinion
For now, this app has no views to display the results.

You need:
1. Rails 5.0.2
2. Please run 'bundle install'
3. 'rails server'


