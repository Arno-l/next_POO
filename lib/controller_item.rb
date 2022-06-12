

class ControllerItem 
  @@new_item_info = nil

  def initialize
    @view = View.new
  end

  def create_item
    params = @view.create_item
    item = Item.new(params.values[0], params.values[1], params.values[2].to_i, params.values[3], params.values[4])
    item.save 
    puts
    puts "                                ID: #{item.id}"
    puts "                                nom: #{item.name}"
    puts "                                prix: #{item.price}"
    puts "                                quantité: #{item.quantity}"
    puts "                                marque: #{item.brand}"
    puts
    puts "          ________________________________________________________"
  end

  def index(section)
   items = Item.all
   current_id = View.get_current_id
   current_item = items.find{ |item| item.id.to_i == current_id.to_i}
   items_sorted = items.sort do |k, v|
    k.name <=> v.name
   end

   items_sorted.each do |item|
      case section
       when 1
        puts "                        #{item.id}.  #{item.name}"
       when 2
        puts "                        #{item.name}"
      end
    end 
  end 

  def show(section)
    items = Item.all
    current_id = @view.show_item
    current_item = items.find{ |item| item.id.to_i == current_id.to_i}
    if items.include?(current_item)
      @view.show_item_info(current_item)
    else 
      puts
      puts "                           Cet item n'existe pas"
      if section == 1
      RouterAdmin.new.perform 
      elsif section == 2
      RouterClient.new.perform
      end
    end
    return current_id
  end

  def update
    while true
      puts
      puts "            _paramètres__________________________________________"
      puts
      puts "                         1.Modifier cet item"
      puts "                         2.Supprimer cet item"
      puts "                         3.Aller au menu"
      puts
      print "                               >> "
      settings = gets.chomp.to_i
      
      case settings
       when 1
        @@new_item_info = @view.update_item
        Item.update
       when 2
        current_id = View.get_current_id
        puts "                       Veux-tu vraiment supprimer l'item n°#{current_id} ? (y/n)"
        print "                                    >> "
        choice = gets.chomp
        if choice == "y" || choice == "Y"
          Item.destroy
          puts "                        L'item n°#{current_id} à bien été supprimé"
          RouterAdmin.new.perform
        elsif choice == "n" || choice == "N"
          self.update  
        else
          puts "                         Ce choix n'existe pas, merci de réessayer"
          self.update  
        end
       when 3
        break
       else
        puts
        puts "            Ce choix n'existe pas, merci de réessayer"
      end
    end
  end

  def self.get_new_item_info
   return @@new_item_info
  end

end