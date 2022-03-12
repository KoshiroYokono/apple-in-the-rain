Rails.application.routes.draw do
  root to: 'home#new'
  get 'home/new'
  post 'question_answer/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
