== form(action: "/items", method: :get ) do
  == csrf_tag
	.row
		.col-1
			== label "account"
		.col-2
			.form-group
				select class="form-control" name="account_id" 
					option value="0" all
					- Account.all.each do |acct|
						option value="#{acct.id}" = acct.name
		.col-1
			== label "from date"
		.col-3
			.form-group
				input type="date" name="from_date" value="from_date" min="2017-01-01" max="2025-01-01" class="form-control"
		.col-1
			== label "to date"
		.col-3
			.form-group
				input type="date" name="to_date" value="to_date" min="2017-01-01" max="2025-01-01" class="form-control"
		.col-1
			.form-group
				== text_field name: "balance", value: "0.0"
		.col-1
  		== submit("filter items", class: "btn btn-primary btn-sm")

.row
  .col-sm-11
    h2 Items
  .col-sm-1
    a.btn.btn-success.btn-sm href="/items/new" New

.table-responsive
  table.table.table-striped
    thead
      tr
        th Account
        th Date
        th Description
        th Typus
        th Amount
        th Balance
        th Actions
    tbody
      - items.each do |item|
        tr
          td = item.account.name
          td = item.date
          td = item.description
          td = item.typus
          td = item.amount
          td style="#{item.color}" = item.balance
          td
            span
              == link_to("read", "/items/#{item.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/items/#{item.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/items/#{ item.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
