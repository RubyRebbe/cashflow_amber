class Item < Granite::Base
  adapter sqlite
  table_name items

	belongs_to :account

  primary id : Int64
  field date : String
  field description : String
  field typus : String
  field amount : Float32
end # class Item
