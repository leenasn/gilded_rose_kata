class GildedRose
  def self.item_for(name, quality, sell_in)
    Object.const_get(name).new(quality, sell_in)
  end
end

class Item
  attr_accessor :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

end

class Normal < Item
  def update_quality
    @sell_in -= 1
    @quality -= 1 if @sell_in > 0

    @quality -= 2 if @sell_in <= 0

    @quality = 50 if @quality > 50

    @quality = 0 if @quality <= 0
  end
end

class AgedBrie < Item
  def update_quality
    @sell_in -= 1
    @quality += 1
  end
end

class Sulfuras < Item
  def update_quality
  end
end
