```
[Insights][ASIA10001][Foo][Bar] = "Baz"

 ->

[Insights][Nested][Foo][Bar]
[Insights][Nested][Identifier] = ASIA10001
```

```ruby
insights = event.get("[Insights]")

if insights
    tmp = insights.to_hash
    if tmp.size == 1
        key, val = tmp.first
        event.set("[Insights][Nested]", event.get("[Insights][#{key}]"))
        event.set("[Insights][Identifier]", key)
        event.remove("[Insights][#{key}]")
    end
end
```
