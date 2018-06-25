# README

This application gets requests with the name of the page on www.debate.org/opinions in the url params. It then uses HttParty gem to make an external call to the above mentioned api and parses the response using Nokogiri gem to print:
- the opinion title
- the yes/no percentage
- the comments and authors for each side of the opinion
For now, this app has no views to display the results.

You need:
1. Rails 5.0.2
2. Please run 'bundle install' in your terminal
3. 'rails server' in the terminal
4. enter this url in your browser: http://localhost:3000/opinions/should-drug-users-be-put-in-prison
5. analyze the output in the terminal, where your server runs.
6. check out the code in app/controllers/opinions_controller#show.

In a future interation I would move the logic under /lib and add some error handling for bad request and missing information. I would also add unit tests for this route.

