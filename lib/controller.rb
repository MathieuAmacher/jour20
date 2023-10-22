require_relative 'gossip'
require_relative 'view'


class Controller

    def initialize
        @view = View.new
    end
    
    def create_gossip
        params = @view.create_gossip
        new_gossip = Gossip.new(params[:author], params[:content])
        new_gossip.save
        return new_gossip
    end

    def index_gossip
        gossips = Gossip.all
        @view.index_gossip(gossips)
    end

    def delete_gossip
        gossips = Gossip.all
        @view.index_gossip(gossips)  # Affiche la liste des gossips à l'utilisateur
      
        puts "Entrez le numéro du gossip que vous souhaitez supprimer :"
        print "> "
        index = gets.chomp.to_i  # Récupérez l'indice saisi par l'utilisateur
      
        if index >= 1 && index <= gossips.length
          # Supprimez le gossip correspondant
          deleted_gossip = gossips.delete_at(index - 1)
      
          # Ouvrez le fichier en mode écriture
          CSV.open('./db/gossip.csv', 'w') do |csv|
            # Écrivez la liste de gossips mise à jour dans le fichier
            gossips.each do |gossip|
              csv << [gossip.author, gossip.content]
            end
          end
      
          puts "Le gossip a été supprimé avec succès."
        else
          puts "Indice invalide. Aucun gossip n'a été supprimé."
        end
      end    
      
end

