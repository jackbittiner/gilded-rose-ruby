require 'gilded_rose'
require 'item'

describe GildedRose do

  let(:normal_item) { Item.new('normal item', 20, 30) }

  describe "#update_quality" do

    context 'of a normal item' do

      subject(:gilded_rose) {described_class.new([normal_item])}

      it "decrease the quality by 1" do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 29
      end

      it 'decreases the sell_in by 1' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].sell_in).to eq 19
      end

      it 'decreases the quality by 2 when sell_in is less than 0' do
        gilded_rose.items[0].sell_in = 0
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 28
      end

      it 'cannot have a quality less than 0' do
        gilded_rose.items[0].quality = 0
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 0
      end
    end
  end
end
