class ItemList
	@items : Granite::Query::Builder(Item)

	def initialize
		@items = Item.order( :date )
	end

	def items
		@items
	end

	def account( account_id)
		if account_id.to_i > 0
			@items = @items.where( account_id: account_id ) # account_id.to_i ?
		end

		return self
	end

	def from_date( date)
		if !date.empty?
			@items = @items.where( :date, :gteq, date )
		end

		return self
	end

	def to_date( date)
		if !date.empty?
			@items = @items.where( :date, :lteq, date )
		end

		return self
	end
end
