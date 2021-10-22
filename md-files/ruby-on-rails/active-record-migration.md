```bash
rails generate migration InitializeDatabase

rails db:migrate
rails db:rollback STEPS=10
```

```rails
class InitializeDatabase < ActiveRecord::Migration[6.1]
  def up
    create_table :virtual_machines do |t|
      t.timestamps
    end
  end

  def down
    drop_table :virtual_machines, if_exists: true, force: true
  end
end
```
