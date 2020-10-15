require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new('chiffon cake', 10, chef) }

  describe "#initialize" do
    
    it 'sets a type' do
      expect(dessert.type).to eq('chiffon cake')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to match_array([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('ice cream cake', '10', chef).to raise_error(ArgumentError) }
    end

  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('butter')
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to include('butter','flour')
    end
  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      dessert.add_ingredient('butter')
      dessert.add_ingredient('flour')
      dessert.add_ingredient('salt')
      dessert.add_ingredient('gasoline')
      expect { dessert.mix! }.to change { dessert.ingredients }
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(11) }.to raise_error
    end
  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jeff the Gruff")
      expect(dessert.serve).to include ("Chef Jeff the Gruff")
    end
  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
