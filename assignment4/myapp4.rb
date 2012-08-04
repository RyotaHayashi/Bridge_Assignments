require 'rubygems'
require 'oauth'
require 'json'
#require 'pp'
#require 'erb'
#require 'sinatra'


 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token("56079326-Xi8m7xg1lqDccKpO87Lx1GdrYTxwsY0kc1V1yHrB0", "x77ivBE6m0RZAu9Zx8RQzjLoRfOEDAPzLUzevgTrQQ")

# use the access token as an agent to get the home timeline
response = access_token.request(:get, "http://api.twitter.com/1/statuses/friends_timeline.json")

#puts response 

result = JSON.parse(response.body)
#pp result

#puts result

#puts response
