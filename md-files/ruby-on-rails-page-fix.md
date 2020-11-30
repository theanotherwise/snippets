# Ruby on Rails Page Fix

```ruby
page = params[:page].to_i
params[:page] != page.to_s or page <= 0 ? (page = 0) : page -= 1

@models = Model.offset(page * 50).limit(50)
```
