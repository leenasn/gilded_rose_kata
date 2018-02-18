require 'test/unit'
require_relative 'item'

class GildedRoseTest < Test::Unit::TestCase
  def test_lower_sell_date_by_one
    item = Normal.new(sell_in: 10, quality: 5)

    item.update_sell_in

    assert_equal(9, item.sell_in)
  end

  def test_lower_the_quality_by_one
    item = Normal.new( sell_in: 10, quality: 5)

    item.update_quality

    assert_equal(4, item.quality)
  end

  def test_quality_degrades_twice_if_sell_date_passed
    item = Normal.new(sell_in: 1, quality: 5)

    item.update_sell_in

    assert_equal(3, item.quality)
  end

  def test_quality_not_negative
    item = Normal.new(sell_in: 1, quality: 0)

    item.update_quality

    assert_equal(0, item.quality)
  end

  def test_quality_not_negative_if_sell_date_passed
    item = Normal.new(sell_in: 1, quality: 0)

    item.update_sell_in

    assert_equal(0, item.quality)
  end

  def test_quality_not_more_than_fifty
    item = Normal.new(sell_in: 1, quality: 100)

    assert_equal(50, item.quality)
  end

  def test_aged_brie_increases_quality_while_getting_older
    item = AgedBrie.new(sell_in: 20, quality: 10)

    item.update_sell_in
    assert_equal(11, item.quality)
  end

  def test_sulfuras_never_gets_older
    item = Sulfuras.new(sell_in: 20, quality: 10)

    item.update_quality
    assert_equal(10, item.quality)
  end

  def test_sulfuras_never_gets_sold
    item = Sulfuras.new(sell_in: 20, quality: 10)

    item.update_sell_in
    assert_equal(20, item.sell_in)
  end
end
