require 'test/unit'
require_relative 'gilded_rose'

class GildedRoseTest < Test::Unit::TestCase
  def test_lower_sell_within_date_by_one
    item = Item.new("Normal", 10, 10)

    GildedRose.new([item]).update_quality

    assert_equal(9, item.sell_in)
  end

  def test_lower_quality_by_one
    item = Item.new("Normal", 10, 10)

    GildedRose.new([item]).update_quality

    assert_equal(9, item.quality)
  end

  def test_lower_quality_by_two_if_sell_in_date_is_reached
    item = Item.new("Normal", 0, 10)

    GildedRose.new([item]).update_quality

    assert_equal(8, item.quality)
  end

  def test_quality_never_negative_when_decreased
    item = Item.new("Normal", 0, 0)

    GildedRose.new([item]).update_quality

    assert_equal(0, item.quality)
  end

  def test_quality_never_greater_than_fifty
    item = Item.new("Normal", 10, 60)

    GildedRose.new([item]).update_quality

    assert_equal(50, item.quality)
  end

  def test_aged_brie_increases_quality_as_it_gets_older
    item = Item.new("Aged Brie", 10, 10)

    GildedRose.new([item]).update_quality

    assert_equal(11, item.quality)
  end

  def test_sulfuras_never_gets_sold
    item = Item.new("Sulfuras", 10, 10)

    GildedRose.new([item]).update_quality

    assert_equal(10, item.sell_in)
  end

  def test_sulfuras_never_gets_older
    item = Item.new("Sulfuras", 10, 10)

    GildedRose.new([item]).update_quality

    assert_equal(10, item.quality)
  end
end
