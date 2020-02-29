require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cookie) {Dessert.new("cookie", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("cookie")
    end
  
    it "sets a quantity" do
      expect(cookie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients.empty?).to be(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "tons") }.to raise_error()
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("eggs")
      expect(cookie.ingredients).to include("eggs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["eggs", "flour", "brown sugar"]
      ingredients.each do |ele|
        cookie.add_ingredient(ele)
      end
      expect(ingredients).to eq(cookie.ingredients)
      cookie.mix!
      expect(ingredients).not_to eq(cookie.ingredients)
      expect(ingredients.sort).to eq(cookie.ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(2)
      expect(cookie.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cookie.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
