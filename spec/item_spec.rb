require 'rspec'
require_relative '../item'

describe 'gilded rose' do
  it 'lower the sell date  by 1' do
    item = Item.new(10, 5)

    item.update_sell_in

    expect(item.sell_in).to eq(9)
  end

  it 'lower the quality by 1' do
    item = Item.new(10, 5)

    item.update_quality

    expect(item.quality).to eq(4)
  end

  it 'quality is degraded twice if sell date is passed' do
    item = Item.new(1, 5)

    item.update_sell_in

    expect(item.quality).to eq(3)
  end

  it 'quality should not be negative when quality is lowered' do
    item = Item.new(1, 0)

    item.update_quality

    expect(item.quality).to eq(0)
  end

  it 'quality should not be negative if sell date is passed' do
    item = Item.new(1, 0)

    item.update_sell_in

    expect(item.quality).to eq(0)
  end

  it 'quality of is never more than 50' do
    item = Item.new(1, 100)

    expect(item.quality).to eq(50)
  end
end
