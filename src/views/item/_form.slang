- if item.errors
  ul.errors
    - item.errors.each do |error|
      li = error.to_s

== form(action: "/items/#{item.id.to_s}", method: item.id ? :patch : :post) do
  == csrf_tag
  .form-group
		input type="date"  name="date" value=item.date min="2017-01-01" max="2025-01-01" class="form-control"
  .form-group
    == text_field(name: "description", value: item.description, placeholder: "Description", class: "form-control")
  .form-group
		- if item.typus == "expense" 
				select class="form-control" name="typus" value=item.typus
					option selected=true value="expense" expense
					option value="income" income
		- else
				select class="form-control" name="typus" value=item.typus
					option value="expense" expense
					option selected=true value="income" income
  .form-group
    == text_field(name: "amount", value: item.amount, placeholder: "Amount", class: "form-control")

  .form-group
		select class="form-control" name="account_id" 
			- Account.all.each do |acct|
				- if (item.account.id == acct.id)
					option value="#{acct.id}" selected=true  = acct.name
				- else
					option value="#{acct.id}" = acct.name

  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/items", class: "btn btn-light btn-sm")
