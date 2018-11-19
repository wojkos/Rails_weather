Rails.application.routes.draw do
  resources :weathers, only: %i[home create show], param: :city
  root to: 'weathers#home'
end
