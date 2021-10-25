require 'bundler'
Bundler.require

print CSV.read("./db/gossip.csv")

