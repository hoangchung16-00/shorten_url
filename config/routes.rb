Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "encode" => "url#encode"
  post "decode" => "url#decode"
  get "/:slug" => "url#redirect"

  root to: "url#index"
end
