Chatbot::Application.routes.draw do
  root :to => 'pages#home'

  post '/user_response' => 'pages#user_response'

end
