require_relative 'item'

class GildedRose

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    update_brie
    update_backstage_passes
    update_normal_item
  end

  def update_brie
    @items.each do |item|
      item.sell_in -= 1 if item.name == 'Brie'
      item.quality += 1 if item.name == 'Brie'
      item.quality = 50 if item.quality > 50
    end
  end

  def update_backstage_passes
    @items.each do |item|
      item.sell_in -= 1 if item.name == 'Backstage Passes'
      item.quality += 1 if item.name == 'Backstage Passes'
      item.quality += 1 if item.name == 'Backstage Passes' && item.sell_in < 5
      item.quality += 1 if item.name == 'Backstage Passes' && item.sell_in < 10
      item.quality = 0 if item.name == 'Backstage Passes' && item.sell_in < 0
    end
  end

  def update_normal_item
    @items.each do |item|
      if item.name != 'Brie' && item.name != 'Sulfuras' && item.name != 'Backstage Passes'
        item.sell_in -= 1
        item.quality -= 1
        if item.sell_in < 0
          item.quality -= 1
        end
        item.quality = 0 if item.quality < 0
      end
    end
  end
end
