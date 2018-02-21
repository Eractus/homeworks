require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new('truffle', 8)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('truffle')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(8)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ dessert.quantity('a billion') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) { dessert.add_ingredient('m&m') }

    it "adds an ingredient to the ingredients array" do
      expect(desserts.ingredients).to_not include('m&m')
      dessert.add_ingredient('m&m')
      expect(desserts.ingredients).to include('m&m')
    end
  end

  describe "#mix!" do
    before(:each) { dessert.add_ingredient('m&') }
    
    it "shuffles the ingredient array" do
      expect(dessert.)
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
