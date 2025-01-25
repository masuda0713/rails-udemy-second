Rails.application.routes.draw do
  get 'users', to: 'users#index'
  root "questions#index" # ルートURLを設定
  resources :questions do # questionsに紐づくanswersをネスト。answersのルーティングを設定
    resources :answers
  end
end
