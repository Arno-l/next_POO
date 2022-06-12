
class Item
 attr_accessor :id, :name, :price, :quantity, :brand 
    
  def initialize(id, name, price, quantity, brand)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @brand = brand
  end

  def save
    CSV.open("db/items.csv", "a+") do |csv|
     csv << [@id, @name, @price, @quantity, @brand]
    end
  end

  def self.all
    @item_list = []
            
    CSV.foreach(("db/items.csv"), headers: true, col_sep: ",") do |row|
      current_item = Item.new(row[0], row[1], row[2], row[3], row[4])
      @item_list << current_item        
    end
    return @item_list
  end
    
  def self.update
    new_item_info = ControllerItem.get_new_item_info
    @item_list.each do |item|
     if item.id.to_i == new_item_info.values[0].to_i
      item.name = new_item_info.values[1]
      item.price = new_item_info.values[2]
      item.quantity = new_item_info.values[3]
      item.brand = new_item_info.values[4]
     end
    end      
    CSV.open('db/items.csv', 'w') do |csv|
    end
    @item_list.each do |item|
      File.open("db/items.csv", 'a+') { |f| f.write("#{item.id},#{item.name},#{item.price},#{item.quantity},#{item.brand}\n")}
    end
  end

  def self.destroy
    current_id = View.get_current_id
    header = "id,Name,price,quantity,brand"
    File.open("db/items.csv", 'w') do |csv| 
      csv << header
      @item_list.each do |item|
       if item.id.to_i != current_id
        csv << "\n"
        csv << item.id
        csv << ","
        csv << item.name
        csv << ","
        csv << item.price
        csv << ","
        csv << item.quantity
        csv << ","
        csv << item.brand
        end
      end
    end
  end
end