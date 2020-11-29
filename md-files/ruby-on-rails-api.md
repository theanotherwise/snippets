# Ruby on Rails API

`config/routes.rb`

```rails
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users', to: 'users#index'
    end
  end
end
```

`app/controllers/api/v1/artists_controller.rb`

```rails
module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        
        render json: @users
      end
    end
  end
end
```
