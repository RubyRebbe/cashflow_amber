class Item < Granite::Base
	@balance = 0.0

  adapter sqlite
  table_name items

	belongs_to :account

  primary id : Int64
  field date : String
  field description : String
  field typus : String
  field amount : Float32

	def balance
		@balance
	end

	def balance=( bal)
		@balance = bal
	end

	def sign
		( typus == "income" ) ? 1 : -1
	end

	def signed_amount
		sign * amount.not_nil!
	end
end # class Item
