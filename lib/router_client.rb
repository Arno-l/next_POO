class RouterClient < RouterAdmin
  @@section = nil
    
  def perform
   @@section = 2
        puts "
            __| |____________________________________________| |__
           (__   ____________________________________________   __)
              | |                                            | |
              | |                \\ The_Spot /               | |
            __| |____________________________________________| |__
           (__   ____________________________________________   __)
              | |                                            | |"

   while true
     puts
     puts "            _menu________________________________________________"
     puts
     puts "                Bonjour cher utilisateur, que veux tu faire ?"
     puts
     puts "                      1.Voir la liste de tous les items"
     puts "                      2.Se connecter en tant qu'Admin"#
     #puts "                     3.Rechercher un item par son ID"
     puts "                      3.Je veux quitter l'app"
     puts
     print "                              >> "
     settings = gets.chomp.to_i
     puts
     puts "             _____________________________________________________"
      case settings
       when 1
        puts
        puts "                  * Voici la liste de tous les items : "
        puts
        @controller.index(@@section)
       when 2
        password = "azerty"
        puts
        puts "          Renseigne le mot de passe pour te connecter en tant qu'Admin :"
        puts
        print "                                 >> "
        choice = gets.chomp
        case choice
         when "azerty"
         RouterAdmin.new.perform
        else
         puts "                  Désolé, ce n'est pas le bon mot de passe"
         self.perform
        end
        when 3
        puts
        puts "                               A bientôt !"
        break
        else
        puts "                     Ce choix n'existe pas, merci de réessayer"
      end
    end
  end
end