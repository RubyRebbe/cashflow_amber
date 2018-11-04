h1 Show Account
p = account.name
p
  == link_to("back", "/accounts", class: "btn btn-light btn-sm")
  == link_to("edit", "/accounts/#{account.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/accounts/#{account.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
