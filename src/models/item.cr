class Item < Granite::Base
  adapter sqlite
  table_name items

	belongs_to :account

  primary id : Int64
  field date : String
  field description : String
  field typus : String
  field amount : Float32

	def sign
		( typus == "income" ) ? 1 : -1
	end

	def signed_amount
		sign * amount.not_nil!
	end

	def balance
		0.0
	end

	# need for type union reasons
	def color
		"color:black" 
	end
end # class Item
