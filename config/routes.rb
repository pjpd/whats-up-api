Rails.application.routes.draw do
  resources :collections do
    resources :webpages
  end
end
