require 'pry'
require 'csv'


class Gossip
    attr_reader :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open('./db/gossip.csv', 'a') do |csv|
            csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = []
        CSV.foreach('db/gossip.csv') do |ligne|
            author, content = ligne
            gossip_provisoire = Gossip.new(author, content)
            all_gossips << gossip_provisoire
        end

        return all_gossips
    end

end
