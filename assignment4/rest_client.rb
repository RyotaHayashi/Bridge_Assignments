require 'rubygems'
require 'restclient'
require 'hpricot'
require 'erb'
require 'sinatra'

get '/form' do
  erb :form
end

post '/form' do

  NUMBER_OF_TWEETS = 20
  TARGET_USERNAME = params[:username]
  GET_STATUSES_URL = "http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=#{TARGET_USERNAME}&count=#{NUMBER_OF_TWEETS}"

  # This is the directory where we want to store the tweet collection
  DATA_DIRECTORY = "data-hold"
  
  if File.exists?(DATA_DIRECTORY)
	FileUtils.rm_rf(DATA_DIRECTORY)
  end

  Dir.mkdir(DATA_DIRECTORY) # unless File.exists?(DATA_DIRECTORY)

  File.open("#{DATA_DIRECTORY}/tweets-#{TARGET_USERNAME}.xml", 'w'){ 
     |outputfile_user_tweets|
      tweets_page = RestClient.get("#{GET_STATUSES_URL}")
	  outputfile_user_tweets.write(tweets_page.body)
  } 

  doc = Hpricot(open("#{DATA_DIRECTORY}/tweets-#{TARGET_USERNAME}.xml"))
  tweets = []

  (doc/'status').each do|st|
      text = (st/'text').inner_html
      #puts "#{text}"
	  tweets.push("#{text}")
  end
  
  #puts tweets
  erb :timeline, :locals => {:tweets_array => tweets}

end
