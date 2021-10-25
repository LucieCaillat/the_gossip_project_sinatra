require 'bundler'
Bundler.require

class Gossip
    attr_accessor :author , :content , :comments
    def initialize(author_to_save , content_to_save)
        @author = author_to_save
        @content = content_to_save
        @comments = []
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
        all_gossips.delete_at(0)
        return all_gossips
    end

    def self.find(id)
        return Gossip.all[id - 1]
    end

    def self.edit(id, new_author , new_content)
        gossips_all = Gossip.all
        new_all_gossip =[]
    
        gossips_all.each do |gossip|
            if gossips_all[id.to_i - 1] == gossip
                gossip.author = new_author
                gossip.content = new_content
                new_all_gossip<< gossip
                puts "oui"
            else
                new_all_gossip<< gossip 
                puts "non"
            end
        end
        CSV.open("db/gossip.csv", "w") do |file|             
            file << ["author","content"]
        end
        new_all_gossip.each do |gossip|
            CSV.open("db/gossip.csv", "ab") do |file| 
                 file << [gossip.author , gossip.content]
            end
        end
    end

    def new_comment(comment_to_save)
        @comments<< comment_to_save
    end

end
#binding.pry
