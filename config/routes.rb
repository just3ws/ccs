Ccs::Application.routes.draw do
  devise_for :users
  resources :imports
  match '/import/proc/:id' => 'imports#proc_csv', :as => :import_proc
  resources :users
  resources :preregistrations, :only => [:create, :index]
  resources :submissions
  match '/static/:path' => 'static#show'
  root :to => 'submissions#new'
  #root :to => "static#show"
end
#== Route Map
# Generated on 16 Feb 2011 16:52
#
#       new_user_session GET    /users/sign_in(.:format)           {:action=>"new", :controller=>"devise/sessions"}
#           user_session POST   /users/sign_in(.:format)           {:action=>"create", :controller=>"devise/sessions"}
#   destroy_user_session GET    /users/sign_out(.:format)          {:action=>"destroy", :controller=>"devise/sessions"}
#          user_password POST   /users/password(.:format)          {:action=>"create", :controller=>"devise/passwords"}
#      new_user_password GET    /users/password/new(.:format)      {:action=>"new", :controller=>"devise/passwords"}
#     edit_user_password GET    /users/password/edit(.:format)     {:action=>"edit", :controller=>"devise/passwords"}
#                        PUT    /users/password(.:format)          {:action=>"update", :controller=>"devise/passwords"}
#      user_registration POST   /users(.:format)                   {:action=>"create", :controller=>"devise/registrations"}
#  new_user_registration GET    /users/sign_up(.:format)           {:action=>"new", :controller=>"devise/registrations"}
# edit_user_registration GET    /users/edit(.:format)              {:action=>"edit", :controller=>"devise/registrations"}
#                        PUT    /users(.:format)                   {:action=>"update", :controller=>"devise/registrations"}
#                        DELETE /users(.:format)                   {:action=>"destroy", :controller=>"devise/registrations"}
#      user_confirmation POST   /users/confirmation(.:format)      {:action=>"create", :controller=>"devise/confirmations"}
#  new_user_confirmation GET    /users/confirmation/new(.:format)  {:action=>"new", :controller=>"devise/confirmations"}
#                        GET    /users/confirmation(.:format)      {:action=>"show", :controller=>"devise/confirmations"}
# accept_user_invitation GET    /users/invitation/accept(.:format) {:action=>"edit", :controller=>"devise/invitations"}
#        user_invitation POST   /users/invitation(.:format)        {:action=>"create", :controller=>"devise/invitations"}
#    new_user_invitation GET    /users/invitation/new(.:format)    {:action=>"new", :controller=>"devise/invitations"}
#                        PUT    /users/invitation(.:format)        {:action=>"update", :controller=>"devise/invitations"}
#                imports GET    /imports(.:format)                 {:action=>"index", :controller=>"imports"}
#                        POST   /imports(.:format)                 {:action=>"create", :controller=>"imports"}
#             new_import GET    /imports/new(.:format)             {:action=>"new", :controller=>"imports"}
#            edit_import GET    /imports/:id/edit(.:format)        {:action=>"edit", :controller=>"imports"}
#                 import GET    /imports/:id(.:format)             {:action=>"show", :controller=>"imports"}
#                        PUT    /imports/:id(.:format)             {:action=>"update", :controller=>"imports"}
#                        DELETE /imports/:id(.:format)             {:action=>"destroy", :controller=>"imports"}
#            import_proc        /import/proc/:id(.:format)         {:controller=>"imports", :action=>"proc_csv"}
#                  users GET    /users(.:format)                   {:action=>"index", :controller=>"users"}
#                        POST   /users(.:format)                   {:action=>"create", :controller=>"users"}
#               new_user GET    /users/new(.:format)               {:action=>"new", :controller=>"users"}
#              edit_user GET    /users/:id/edit(.:format)          {:action=>"edit", :controller=>"users"}
#                   user GET    /users/:id(.:format)               {:action=>"show", :controller=>"users"}
#                        PUT    /users/:id(.:format)               {:action=>"update", :controller=>"users"}
#                        DELETE /users/:id(.:format)               {:action=>"destroy", :controller=>"users"}
#       preregistrations GET    /preregistrations(.:format)        {:action=>"index", :controller=>"preregistrations"}
#                        POST   /preregistrations(.:format)        {:action=>"create", :controller=>"preregistrations"}
#            submissions GET    /submissions(.:format)             {:action=>"index", :controller=>"submissions"}
#                        POST   /submissions(.:format)             {:action=>"create", :controller=>"submissions"}
#         new_submission GET    /submissions/new(.:format)         {:action=>"new", :controller=>"submissions"}
#        edit_submission GET    /submissions/:id/edit(.:format)    {:action=>"edit", :controller=>"submissions"}
#             submission GET    /submissions/:id(.:format)         {:action=>"show", :controller=>"submissions"}
#                        PUT    /submissions/:id(.:format)         {:action=>"update", :controller=>"submissions"}
#                        DELETE /submissions/:id(.:format)         {:action=>"destroy", :controller=>"submissions"}
#                               /static/:path(.:format)            {:controller=>"static", :action=>"show"}
#                   root        /(.:format)                        {:controller=>"submissions", :action=>"new"}
