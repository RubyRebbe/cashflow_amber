- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/items" ? "active" : ""
a class="nav-item #{active}" href="/items" Items
- active = context.request.path == "/accounts" ? "active" : ""
a class="nav-item #{active}" href="/accounts" Accounts
