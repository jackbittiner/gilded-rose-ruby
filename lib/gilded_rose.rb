require_relative 'item'

class GildedRose

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    update_brie
    # @items.each do |item|
    #   if item.name != "Brie" and item.name != "Backstage Passes"
    #     if item.quality > 0
    #       if item.name != "Sulfuras"
    #         item.quality = item.quality - 1
    #       end
    #     end
    #   else
    #     if item.quality < 50
    #       item.quality = item.quality + 1
    #       if item.name == "Backstage Passes"
    #         if item.sell_in < 11
    #           if item.quality < 50
    #             item.quality = item.quality + 1
    #           end
    #         end
    #         if item.sell_in < 6
    #           if item.quality < 50
    #             item.quality = item.quality + 1
    #           end
    #         end
    #       end
    #     end
    #   end
    #   if item.name != "Sulfuras"
    #     item.sell_in = item.sell_in - 1
    #   end
    #   if item.sell_in < 0
    #     if item.name != "Brie"
    #       if item.name != "Backstage Passes"
    #         if item.quality > 0
    #           if item.name != "Sulfuras"
    #             item.quality = item.quality - 1
    #           end
    #         end
    #       else
    #         item.quality = item.quality - item.quality
    #       end
    #     else
    #       if item.quality < 50
    #         item.quality = item.quality + 1
    #       end
    #     end
    #   end
    # end
  end

  def update_brie
    @items.each do |item|
      item.quality += 1 if item.name == 'Brie'
      item.sell_in -= 1 if item.name == 'Brie'
      item.quality = 50 if item.quality > 50
    end
  end
end
