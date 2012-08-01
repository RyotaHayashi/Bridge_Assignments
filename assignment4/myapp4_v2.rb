require 'rubygems'
require 'restclient'
require 'nokogiri'
require 'sinatra'
require 'erb'

get '/form' do
  erb :form
end

post '/form' do
  NUMBER_OF_TWEETS = 20
  TARGET_USERNAME = params[:username]
  GET_STATUSES_URL = "http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=#{TARGET_USERNAME}&count=#{NUMBER_OF_TWEETS}"
  tweets = [] #array to keep tweets
  
  response = Nokogiri::XML(RestClient.get("#{GET_STATUSES_URL}"))
  response.xpath('//status/text').each do |node|
    tweets.push(node.text)
  end

  erb :timeline, :locals => {:tweets_array => tweets}
end