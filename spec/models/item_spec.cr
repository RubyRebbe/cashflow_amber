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

	it "has a volatile attribute - balance" do
		item = Item.create( date: "2018-11-1", account_id: 1 )
		item.balance = 25.00
		item.balance.should eq 25.00
	end

	it "can compute the sign of the amount as function of transaction type" do
		item = Item.create( date: "2018-11-1", account_id: 1 , typus: "expense" )
		item.sign.should eq -1
	end

	it "can compute the signed amount" do
		item = Item.create( typus: "expense", amount: 300.00 )
		item.sign.should eq -1

		item.signed_amount.should eq -300.00
	end
end
