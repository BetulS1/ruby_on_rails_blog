Rails.application.routes.draw do
  devise_for :users
  resources :data
  root 'data#index' # yeni home sayfası root olarak ayarlandı 
  get 'home/about' # about sayfası için yönlendirme
  
end
