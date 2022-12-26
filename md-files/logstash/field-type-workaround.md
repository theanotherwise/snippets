```yaml
filter {
    ruby {
        code =>'
            sub_field = "[kubernetes][labels]"
            target_field = "app"

            source_field = "#{sub_field}[#{target_field}]"

            obj = event.get(source_field)

            if obj.instance_of?(Array)
                event.set("#{sub_field}[#{target_field}_arr]", obj.to_s)
            elsif obj.instance_of?(Hash)
                event.set("#{sub_field}[#{target_field}_obj]", obj)
            elsif obj.to_i.to_s == obj || obj.instance_of?(Integer)
                event.set("#{sub_field}[#{target_field}_int]", obj.to_i)
            elsif obj.to_f.to_s == obj || obj.instance_of?(Float)
                event.set("#{sub_field}[#{target_field}_float]", obj.to_f)
            else
                event.set("#{sub_field}[#{target_field}_str]", obj)
            end

            event.remove(source_field)
        '
    }
}
```
