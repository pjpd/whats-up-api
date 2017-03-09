Rails.application.routes.draw do
  post 'static_pages/is_text_at_url'

  resources :collections do
    resources :webpages
  end
end
