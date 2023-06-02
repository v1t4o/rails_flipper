Rails.application.routes.draw do
  resources :cars
  mount Flipper::UI.app(Flipper) => '/flipper'
end
