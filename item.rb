class Item
  MAX_QUALITY = 50

  attr_accessor :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @quality = MAX_QUALITY if @quality > MAX_QUALITY
  end

  def update_sell_in
    @sell_in -= 1
    update_quality(-2) if @sell_in.zero?
  end

  def update_quality(amount = -1)
    @quality += amount
    @quality = 0 if @quality < 0
  end
end

class Sulfuras < Item
  def initialize(sell_in:, quality:)
    super(name: self.class.name, sell_in: sell_in, quality: quality)
  end

  def update_sell_in; end

  def update_quality; end
end

class Normal < Item
  def initialize(sell_in:, quality:)
    super(name: self.class.name, sell_in: sell_in, quality: quality)
  end

end

class AgedBrie < Item
  def initialize(sell_in:, quality:)
    super(name: self.class.name, sell_in: sell_in, quality: quality)
  end

  def update_sell_in
    update_quality(1)
  end
end
