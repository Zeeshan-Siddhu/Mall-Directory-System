class Shop < ActiveRecord::Base
  require 'csv'
  validates_presence_of :name
  validates_presence_of :location
  belongs_to :mall

  def update_information attributes
    update name: attributes[:name], location: attributes[:location]
  end

  def self.get_by_alphabet prefix
    where("name LIKE :prefix or name LIKE :prefix1", prefix: "#{prefix}%", prefix1: "#{prefix.downcase}%")
  end

  def self.to_txt
    directory = [['name', 'location'].join("\t")]
    all.find_each do |shop|
      directory << [[shop.name, shop.location].join("\t")]
    end
    directory.join("\n")
  end

  def self.to_csv
    attributes = %w{name location}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |shop|
        csv << attributes.map{ |attr| shop.send(attr) }
      end
    end  
  end

  
end
