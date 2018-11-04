class Account < Granite::Base
  adapter sqlite
  table_name accounts

	has_many :items

  primary id : Int64
  field name : String
end
