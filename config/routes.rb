Rails.application.routes.draw do


#user模型
  post '/users/dologin' => 'users#dologin'
  get  '/users/show' => 'users#show'
  get  '/users/login' => '/'
  get  '/users/register' => 'users#register'
  post '/users/register' => 'users#register'
  post '/users/do_register' => 'users#do_register'
  get  '/users/center' => 'users#center'
  get  '/users/personal' => 'users#personal'
  get  '/users/personalmessage' => 'users#personalmessage'
  get  '/users/personalcomment' => 'users#personalcomment'
  get  '/messagedestroy/users/:id' => 'users#messagedestroy', as: :messagedestroy_user
  get  '/commentdestroy/users/:id' => 'users#commentdestroy', as: :commentdestroy_user


#message模型
  get  '/messages/index' => 'messages#index'
  get  '/messages/article' => 'messages#article'
  post '/messages/domessage' => 'messages#domessage'
  get  '/messages/leave' => 'messages#leave'
  get  '/show/messages/:id' => 'messages#show', as: :show_message
  get  '/destroy/messages/:id' => 'messages#destroy', as: :destroy_message


#comments模型
  get  '/comments/destroy' => 'comments#destroy'
  post '/comments/do_comment/:message_id' => 'comments#do_comment'
  get  '/do_comment/comments/:message_id' => 'comments#do_comment', as: :do_comment_comment
  get  '/destroy/comments/:id' => 'comments#destroy', as: :destroy_comment


#pictures模型
  get  '/pictures/index' => 'pictures#index'
  get  '/pictures/picture' => 'pictures#picture'
  get  '/pictures/new' => 'pictures#new'
  get  '/pictures/album' => 'pictures#album'
  post '/pictures/newalbum' => 'pictures#newalbum'
  post '/pictures/newpic' => 'pictures#newpic'
  get  '/show/pictures/:id' => 'pictures#show', as: :show_pictures
  get  '/slidepic/pictures/:id' => 'pictures#slidepic', as: :slidepic_pictures


  root 'users#login'
  
 
end
