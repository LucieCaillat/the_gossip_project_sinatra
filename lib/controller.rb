require 'bundler'
Bundler.require
require'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
      
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"] , params["gossip_content"]).save
    puts "\n#{params}"
    puts "\n"
    redirect '/'
     
  end

  get '/gossips/:id' do
    
    erb :shower, locals: {gossip: Gossip.find(params['id'].to_i)}
        
  end

end