require 'gilded_rose'
require 'item'

describe GildedRose do

  let(:normal_item) { Item.new('normal item', 20, 30) }
  let(:brie) { Item.new('Brie', 20, 30) }
  let(:sulfuras) { Item.new('Sulfuras', 20, 30) }
  let(:backstage_passes) { Item.new('Backstage Passes', 20, 30) }

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

    context 'Brie' do

      subject(:gilded_rose) {described_class.new([brie])}

      it 'increase quality by 1' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 31
      end

      it 'decreases sell_in by 1' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].sell_in).to eq 19
      end

      it 'cannot have a quality greater than 50' do
        gilded_rose.items[0].quality = 50
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 50
      end
    end

    context 'Sulfuras' do

      subject(:gilded_rose) {described_class.new([sulfuras])}

      it 'does not change quality at all' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 30
      end

      it 'does not change sell_in at all' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].sell_in).to eq 20
      end
    end

    context 'Backstage Passes' do

      subject(:gilded_rose) {described_class.new([backstage_passes])}

      it 'decreases the sell_in by 1' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].sell_in).to eq 19
      end

      it 'increases quality by one if over ten days left' do
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 31
      end

      it 'increases quality by 2 if less than 10 days left' do
        gilded_rose.items[0].sell_in = 9
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 32
      end

      it 'increases quality by 3 if less than 5 days left' do
        gilded_rose.items[0].sell_in = 3
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 33
      end

      it 'decreases quality to 0 when no days left for sell_in' do
        gilded_rose.items[0].sell_in = 0
        gilded_rose.update_quality
        expect(gilded_rose.items[0].quality).to eq 0
      end

    end
  end
end
