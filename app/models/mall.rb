class Mall < ActiveRecord::Base
  has_many :shops

  def create_shop attributes
    shops.create name: attributes[:name], location: attributes[:location]
  end

  def upload_directory path
    ids = []
    File.foreach(path).with_index do |line, index|
      line      = line.delete("\n")
      shop_info = line.split("\t")
      name      = shop_info[0]
      location  = shop_info[1]
      if (shop = (shops.find_by_name name))
        shop.update location: location unless shop.location == location
      else
        shop = create_shop name: name, location: location
      end
      ids << shop.id if shop.persisted?
    end
    shops.where.not(id: ids).destroy_all
  end

end
