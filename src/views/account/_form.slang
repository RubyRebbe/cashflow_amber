- if account.errors
  ul.errors
    - account.errors.each do |error|
      li = error.to_s

== form(action: "/accounts/#{account.id.to_s}", method: account.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: account.name, placeholder: "Name", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/accounts", class: "btn btn-light btn-sm")
