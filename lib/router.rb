require_relative 'controller'

class Router

    def initialize
        @controller = Controller.new
        @view = View.new
    end

    def perform
        puts "Bienvenue dans 'The Gossip Project"

        while true

            puts "Tu veux faire quoi jeune mouss' ?"
            puts "1\. Je veux créer un gossip"
            puts "2\. Afficher les potins"
            puts "3\. Supprimer un potin"
            puts "4\. Je veux quitter l'app"
            params= gets.chomp.to_i

            case params
            when 1
                puts "Tu as choisi de créer un gossip"
                @controller.create_gossip

            when 2
                @controller.index_gossip

            when 3
                @controller.delete_gossip

            when 4
                puts "A bientôt !"
                break
            
            else
                puts "Ce choix n'existe pas, merci de reesayer"
            end
        end
    end
end
