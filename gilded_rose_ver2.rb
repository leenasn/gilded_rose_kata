class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "AgedBrie"
        if item.quality > 0
          if item.name != "Sulfuras"
            item.quality = item.quality - 1
          end
        end
      else
        item.quality = item.quality + 1
      end
      if item.name != "Sulfuras"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "AgedBrie"
          if item.quality > 0
            if item.name != "Sulfuras"
              item.quality = item.quality - 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality > 50
          item.quality = 50
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end
