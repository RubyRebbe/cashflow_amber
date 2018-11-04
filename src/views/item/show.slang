h1 Show Item
p 
	b Date:
	= item.date
p 
	b Description:
	= item.description
p 
	b Transaction type:
	= item.typus
p 
	b Amount:
	= item.amount
p
	b Account:
		= item.account.name

p
  == link_to("back", "/items", class: "btn btn-light btn-sm")
  == link_to("edit", "/items/#{item.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/items/#{item.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
