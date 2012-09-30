module Models
  class Item
    @@items = Array.new
    attr_accessor :name, :price, :owner, :active

    def self.all
      @@items
    end

    def self.by_name(name)
      for item in @@items
        if(item.name = name)
          return item
        end
      end
    end

    def self.named(name, price, owner)
      item = self.new(price, owner)
      item.name = name
      @@items.push(item)
      item
    end

    def initialize(price, owner)
      self.price = price
      self.owner = owner
      self.active = false
    end
  end
end