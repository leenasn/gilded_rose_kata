class GildedRose
  def self.create_item(name: "Normal", quality:, sell_within_date: )
    Object.const_get(name).new(quality: quality, sell_within_date: sell_within_date)
  end
end

class Item
  attr_reader :sell_within_date, :quality

  MAX_VALUE = 50

  def initialize(quality:, sell_within_date:)
    @sell_within_date = sell_within_date
    @quality = quality
    set_quality_to_max_value_if_greater
  end

  def lower_sell_within_date
    @sell_within_date -= 1
    lower_quality(2) if value_less_than_or_equal_to_zero?(@sell_within_date)
  end

  def lower_quality(val = 1)
    @quality -= val
    @quality = 0 if value_less_than_or_equal_to_zero?(@quality)
  end

  private

  def value_less_than_or_equal_to_zero?(val)
    val <= 0
  end

  def set_quality_to_max_value_if_greater
    @quality = MAX_VALUE if quality > MAX_VALUE
  end
end

class Normal < Item
end

class AgedBrie < Item

  def lower_sell_within_date
    super
    increase_quality
  end

  def increase_quality
    @quality += 1
  end
end

class Sulfuras < Item

  def lower_sell_within_date
  end

  def lower_quality
  end
end
