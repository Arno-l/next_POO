
class View
  @@current_id = nil

  def  is_consistent?(name, price)
    if name.length > 30 && price.to_i < 0
      puts "⚠️  Le nom de l'item ne doit pas dépasser 30 caractères"
      puts "⚠️  Le prix de l'item ne peut pas être négatif"
      
    elsif name.length > 30
      puts "⚠️  Le nom de l'item ne doit pas dépasser 30 caractères"
    
    elsif price.to_i < 0
      puts "⚠️  Le prix de l'item ne peut pas être négatif"
      
    else 
      return true
    end
  end

  def show_item_info(current_item)
    puts "                       ID: #{current_item.id}"
    puts "                       nom: #{current_item.name}"
    puts "                       prix: #{current_item.price}"
    puts "                       quantité: #{current_item.quantity}"
    puts "                       marque: #{current_item.brand}"
  end

  def self.get_current_id
    return @@current_id.to_i
  end


  def create_item
    id = Item.all.length + 1
    puts
    puts "                  Quel nom veut tu donner à ton item ?"
    print "                           >> "
    name = gets.chomp
    puts
    puts "                  A quel montant veux-tu fixer ton item ?"
    print "                           >> "
    price = gets.chomp.to_i
    puts
    puts "                  Combien de fois veux-tu ajouter cet item ?"
    print "                           >> "
    quantity = gets.chomp
    puts
    puts "                  Quel est la marque de ton item ? "
    print "                           >> "
    brand = gets.chomp

    if is_consistent?(name, price)
     params = { 
      "id" => id,
      "name" => name,
      "price" => price,
      "quantity" => quantity,
      "brand" => brand }
      puts
      puts "          ________________________________________________________"
      puts
      puts "                    Cool! Ton item à bien été ajouté 👍"
    else
      create_item
    end
    return params 
  end

  def show_item
    puts "                      Rechercher un item par son ID :"
    puts
    print "                       >> "
    id = gets.chomp
    @@current_id = id.to_i
    return @@current_id
  end

  def update_item
    puts
    puts "                      Nouveau nom :"
    print "                       >> "
    new_name = gets.chomp
    puts 
    puts "                      Nouveau prix :"
    print "                       >> "
    new_price = gets.chomp
    puts
    puts "                      Nouvelle quantité :"
    print "                       >> "
    new_quantity = gets.chomp
    puts
    puts "                      Nouvelle marque :"
    print "                       >> "
    new_brand = gets.chomp
     
    if is_consistent?(new_name, new_price)
     params = { 
      "id" => @@current_id,
      "name" => new_name,
      "price" => new_price,
      "quantity" => new_quantity,
      "brand" => new_brand }
      puts
      puts "          ________________________________________________________"
      puts
      puts "                    L'item n° #{@@current_id} a bien été modifié 🔧"
    else
      self.update_item
    end
    return params
    return @@current_id
  end

end