.row
  .col-sm-11
    h2 Items
  .col-sm-1
    a.btn.btn-success.btn-sm href="/items/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Date
        th Description
        th Typus
        th Amount
        th Actions
    tbody
      - items.each do |item|
        tr
          td = item.date
          td = item.description
          td = item.typus
          td = item.amount
          td
            span
              == link_to("read", "/items/#{item.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/items/#{item.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/items/#{ item.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
