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

  get '/gossip/edit' do
    erb :edit, locals: {gossips: Gossip.all}
  end

  post '/gossip/edit' do
    Gossip.edit(params['id'], params['new_gossip_author'] , params['new_gossip_content'])
    puts params['id']
    puts Gossip.find(params['id'].to_i)
    puts params['new_gossip_author'] 
    puts params['new_gossip_content']
    puts Gossip.all

    redirect '/'
  end

end

