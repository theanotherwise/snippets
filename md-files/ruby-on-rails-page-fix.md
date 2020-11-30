# Ruby on Rails Page Fix (1, 2, 3, ...)

```ruby
page = params[:page].to_i
params[:page] != page.to_s or page < 1 ? (page = 0) : page -= 1

@models = Model.offset(page * 50).limit(50)
```
