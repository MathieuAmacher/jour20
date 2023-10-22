

class View

    def create_gossip
        puts "Quel est ton prénom"
        print ">.."
        author = gets.chomp
        
        puts "Quel la merde que tu as à dire ?"
        print ">.."
        content = gets.chomp

        params = { author: author, content: content }

        return params
    end

    def index_gossip(gossips)
        puts "Liste des gossips :"
        gossips.each_with_index do |gossip, index|
          puts "#{index + 1}. Auteur : #{gossip.author}, Contenu : #{gossip.content}"
        end
    end
end