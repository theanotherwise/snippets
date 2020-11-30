# Ruby on Rails - Page Fix

```ruby
if params[:page] != params[:page].to_i.to_s or params[:page].to_i <= 0
  page = 0
else
  page = params[:page].to_i - 1
end
```
