require 'rubygems' 
require 'json'
require 'erb'
require 'sinatra'

# Produce result displayed.
get '/' do

	file = "data/test.json"
	data = open(file).read
	vals = JSON.parse(data)
    
	#load .erb file
	#File.open("data/template.erb") {|fh|

    erb :template, :locals => {:hash => vals}
    #"Welcome"
    
    #create a new ERB instance
	#erb = ERB.new (fh.read)
	
	#print result
    #"#{erb.result(binding)}"
end

