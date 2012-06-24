require 'rubygems'
require 'oauth'
require 'json'
#require 'pp'
#require 'erb'
#require 'sinatra'

# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new(
	   "MPS14BRSSCdwA1JClJWQ",
	   "8eaw5GQ1ESAPNzwDAASNotNNaHvhUjJjpvXKXsyjQCE",
     { :site => "http://api.twitter.com",
       :scheme => :header
	 })
  # now create the access token object from passed values
  token_hash = { :oauth_token => "56079326-Xi8m7xg1lqDccKpO87Lx1GdrYTxwsY0kc1V1yHrB0",
                 :oauth_token_secret => "x77ivBE6m0RZAu9Zx8RQzjLoRfOEDAPzLUzevgTrQQ"
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end
 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token("56079326-Xi8m7xg1lqDccKpO87Lx1GdrYTxwsY0kc1V1yHrB0", "x77ivBE6m0RZAu9Zx8RQzjLoRfOEDAPzLUzevgTrQQ")

# use the access token as an agent to get the home timeline
response = access_token.request(:get, "http://api.twitter.com/1/statuses/friends_timeline.json")

#puts response 

result = JSON.parse(response.body)
#pp result

#puts result

#puts response
