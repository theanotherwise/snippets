```
[Insights][ASIA10001][Example]

->

[Insights][Nested][Example]
[Insights][Nested][Identt] = ASIA10001
```

```ruby
insights = event.get("[Insights]")

if insights
    tmp = insights.to_hash
    if tmp.size == 1
        key, val = tmp.first
        event.set("[Insights][Parsed]", event.get("[Insights][#{key}]"))
        event.set("[Insights][Asia]", key)
        event.remove("[Insights][#{key}]")
    end
end
```
