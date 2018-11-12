require "../spec_helper"
require "../../src/lib/item_list.cr"
require "../../src/models/item.cr"

describe ItemList do
  Spec.before_each do
    Item.clear
  end

	it "can create an item list" do
		item_list = ItemList.new
	end

	it "can calculate balances for an empty item list" do
		item_list = ItemList.new
		item_list.items.size.run.should eq 0
		item_list.balance( 0.0)
	end

	it "can calculate balances for an item list with 1 item" do
		item = Item.create( typus: "income", amount: 1.00, description: "test item" )
		item_list = ItemList.new
		item_list.items.size.run.should eq 1
		item_list.balance( 0.0)
		puts item_list.items.map { |i| [ i.description, i.balance ] }
	end
end
