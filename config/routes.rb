Rails.application.routes.draw do
  namespace : api do 
    resources :sessions, :reviews 
  end 
end
