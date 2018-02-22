require 'test/unit'
require_relative 'gilded_rose'

class GildedRoseTest < Test::Unit::TestCase
  def test_lower_sell_within_date_by_one
    item = GildedRose.create_item(quality: 10, sell_within_date: 5)

    item.lower_sell_within_date

    assert_equal(4, item.sell_within_date)
  end

  def test_lower_quality_by_one
    item = GildedRose.create_item(quality: 10, sell_within_date: 5)

    item.lower_quality

    assert_equal(9, item.quality)
  end

  def test_lower_quality_by_two_if_sell_in_date_is_reached
    item = GildedRose.create_item(quality: 10, sell_within_date: 1)

    item.lower_sell_within_date

    assert_equal(8, item.quality)
  end

  def test_quality_never_negative_when_decreased
    item = GildedRose.create_item(quality: 0, sell_within_date: 1)

    item.lower_quality

    assert_equal(0, item.quality)
  end

  def test_quality_never_negative_when_sell_in_date_approached
    item = GildedRose.create_item(quality: 0, sell_within_date: 1)

    item.lower_sell_within_date

    assert_equal(0, item.quality)
  end

  def test_quality_never_greater_than_fifty
    item = GildedRose.create_item(quality: 60, sell_within_date: 10)

    assert_equal(50, item.quality)
  end

  def test_aged_brie_increases_quality_as_it_gets_older
    item = AgedBrie.new(quality: 10, sell_within_date: 10)

    item.lower_sell_within_date

    assert_equal(11, item.quality)
  end

  def test_sulfuras_never_gets_sold
    item = Sulfuras.new(quality: 10, sell_within_date: 10)

    item.lower_sell_within_date

    assert_equal(10, item.sell_within_date)
  end

  def test_sulfuras_never_gets_older
    item = Sulfuras.new(quality: 10, sell_within_date: 10)

    item.lower_quality

    assert_equal(10, item.quality)
  end
end
