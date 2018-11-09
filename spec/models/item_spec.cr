require "./spec_helper"
require "../../src/models/item.cr"

describe Item do
  Spec.before_each do
    Item.clear
  end

	it "can create an Item object" do
		t = Time.new( 2018, 11, 1)
		item = Item.create( date: "2018-11-1" )
		item.date.should eq "2018-11-1"
	end

	it "can assign a Time object to the date field" do
		date_v = [ 2018, 11, 1 ]
		date_t = Time.new( date_v[0], date_v[1], date_v[2] )
		puts "the date_t:"
		puts date_t.inspect

		item = Item.create( date: date_t )
		puts "item.date:"
		puts item.date
	end

	it "can find item objects in a date (time) range" do
		# by Time object as date field value
		date_v = [ 2018, 11, 1 ]
		date_t = Time.new( date_v[0], date_v[1], date_v[2] )
		item = Item.create( date: date_t )

		from_date = Time.new( 2018, 10, 1)
		to_date = Time.new( 2018, 12, 1 )

		puts "items whose date is >= from_date"
		Item.where( :date, :gteq, from_date ).map { |i| i.date }.should eq [ item.date ] 

		puts "items whose date is <= to_date"
		Item.where( :date, :lteq, to_date ).map { |i| i.date }.should eq [ item.date ] 
 
		# by date string as date field value
		from_date_s = "2018-10-1"
		to_date_s = "2018-12-1"

		Item.where( :date, :gteq, from_date_s ).map { |i| i.date }.should eq [ item.date ] 
		Item.where( :date, :lteq, to_date_s ).map { |i| i.date }.should eq [ item.date ] 
	end

	it "has a class method Item.filter" do
		params = { account_id: 1 }
		item = Item.create( date: "2018-11-1" )
		items = Item.filter( params)
	end

	it "Item.filter takes a params argument" do
		params = { account_id: 1 }
		item = Item.create( date: "2018-11-1", account_id: 1 )
		items = Item.filter( params )
	end

	it "when params has none of :account_id, :from_date, :to_date, it returns all the Items in order" do
		params = { } of Symbol => ( String | Int32 )
		item = Item.create( date: "2018-11-1", account_id: 1 )
		items = Item.filter( params )

		items.count.run.should eq 1 # dumb, count should return number of items in the list
		items.map { |i| i.date }.should eq [ item.date ]
	end
end
