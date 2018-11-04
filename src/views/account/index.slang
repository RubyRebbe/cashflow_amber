.row
  .col-sm-11
    h2 Accounts
  .col-sm-1
    a.btn.btn-success.btn-sm href="/accounts/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Actions
    tbody
      - accounts.each do |account|
        tr
          td = account.name
          td
            span
              == link_to("read", "/accounts/#{account.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/accounts/#{account.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/accounts/#{ account.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
