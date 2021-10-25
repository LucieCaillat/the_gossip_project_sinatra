require 'bundler'
Bundler.require

class Gossip
    attr_accessor :author , :content
    def initialize(author_to_save , content_to_save)
        @author = author_to_save
        @content = content_to_save
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all 
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        return Gossip.all[id - 1]
    end

end
#binding.pry
