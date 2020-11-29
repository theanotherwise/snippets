# Ruby on Rails API

`routes.rb`
```rails
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # routes
    end
  end
end
```

`controller`
```rails
app/controllers/api/v1/artists_controller.rb
module Api
  module V1
    class UsersController < ApplicationController
    end
  end
end
```
