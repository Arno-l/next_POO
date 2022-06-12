class RouterAdmin
 @@section = nil
    
  def initialize
    @controller = ControllerItem.new
  end
    
  def perform
   @@section = 1
        puts "
             __| |____________________________________________| |__
            (__   ____________________________________________   __)
               | |                                            | |
               | |                 \\ The_Spot /              | |
             __| |____________________________________________| |__
            (__   ____________________________________________   __)
               | |                                            | |"

   while true
     puts
     puts "            _menu________________________________________________"
     puts
     puts "                  Bonjour Admin, que veux tu faire ?"
     puts
     puts "                      1.Créer un item"
     puts "                      2.Voir la liste de tous les items"
     puts "                      3.Rechercher un item par son ID"
     puts "                      4.Revenir en mode utilisateur"
     puts
     print "                              >> "
     settings = gets.chomp.to_i
     puts
     puts "             _____________________________________________________"
        
     case settings
       when 1
        puts
        puts "                   * Tu as choisis de créer un item *"
        puts "                             Let's goo !"
        @controller.create_item
       when 2
        puts
        puts "                  * Voici la liste de tous les items : *"
        puts
        @controller.index(@@section)
       when 3
        puts
        @controller.show(@@section)
        @controller.update
       when 4
        puts
        puts "                               A bientôt Admin !"
        RouterClient.new.perform
       else
        puts "                Ce choix n'existe pas, merci de réessayer"
      end
    end
  end
end