Ccs::Application.routes.draw do
  resources :schedules
  match '/schedule' => "schedules#index"

  resources :rooms

  resources :time_slots

  resources :sponsors

  resources :sponsorship_levels

  resources :features

  devise_for :users
  resources :sesjas, :path => "sessions"
  resources :contents
  resources :imports
  resources :users
  match 'speakers' => 'users#index'
  resources :preregistrations, :only => [:create, :index]
  resources :submissions
  resources :contents

  match '/import/proc/:id' => 'imports#proc_csv', :as => :import_proc
  match '/:path' => 'contents#show' # this needs to be the last non-default route

  root :to => 'sesjas#index'
  #root :to => "contents#show"
end
#== Route Map
# Generated on 02 May 2011 18:17
#
#                schedules GET    /schedules(.:format)                   {:action=>"index", :controller=>"schedules"}
#                          POST   /schedules(.:format)                   {:action=>"create", :controller=>"schedules"}
#             new_schedule GET    /schedules/new(.:format)               {:action=>"new", :controller=>"schedules"}
#            edit_schedule GET    /schedules/:id/edit(.:format)          {:action=>"edit", :controller=>"schedules"}
#                 schedule GET    /schedules/:id(.:format)               {:action=>"show", :controller=>"schedules"}
#                          PUT    /schedules/:id(.:format)               {:action=>"update", :controller=>"schedules"}
#                          DELETE /schedules/:id(.:format)               {:action=>"destroy", :controller=>"schedules"}
#                    rooms GET    /rooms(.:format)                       {:action=>"index", :controller=>"rooms"}
#                          POST   /rooms(.:format)                       {:action=>"create", :controller=>"rooms"}
#                 new_room GET    /rooms/new(.:format)                   {:action=>"new", :controller=>"rooms"}
#                edit_room GET    /rooms/:id/edit(.:format)              {:action=>"edit", :controller=>"rooms"}
#                     room GET    /rooms/:id(.:format)                   {:action=>"show", :controller=>"rooms"}
#                          PUT    /rooms/:id(.:format)                   {:action=>"update", :controller=>"rooms"}
#                          DELETE /rooms/:id(.:format)                   {:action=>"destroy", :controller=>"rooms"}
#               time_slots GET    /time_slots(.:format)                  {:action=>"index", :controller=>"time_slots"}
#                          POST   /time_slots(.:format)                  {:action=>"create", :controller=>"time_slots"}
#            new_time_slot GET    /time_slots/new(.:format)              {:action=>"new", :controller=>"time_slots"}
#           edit_time_slot GET    /time_slots/:id/edit(.:format)         {:action=>"edit", :controller=>"time_slots"}
#                time_slot GET    /time_slots/:id(.:format)              {:action=>"show", :controller=>"time_slots"}
#                          PUT    /time_slots/:id(.:format)              {:action=>"update", :controller=>"time_slots"}
#                          DELETE /time_slots/:id(.:format)              {:action=>"destroy", :controller=>"time_slots"}
#                 sponsors GET    /sponsors(.:format)                    {:action=>"index", :controller=>"sponsors"}
#                          POST   /sponsors(.:format)                    {:action=>"create", :controller=>"sponsors"}
#              new_sponsor GET    /sponsors/new(.:format)                {:action=>"new", :controller=>"sponsors"}
#             edit_sponsor GET    /sponsors/:id/edit(.:format)           {:action=>"edit", :controller=>"sponsors"}
#                  sponsor GET    /sponsors/:id(.:format)                {:action=>"show", :controller=>"sponsors"}
#                          PUT    /sponsors/:id(.:format)                {:action=>"update", :controller=>"sponsors"}
#                          DELETE /sponsors/:id(.:format)                {:action=>"destroy", :controller=>"sponsors"}
#       sponsorship_levels GET    /sponsorship_levels(.:format)          {:action=>"index", :controller=>"sponsorship_levels"}
#                          POST   /sponsorship_levels(.:format)          {:action=>"create", :controller=>"sponsorship_levels"}
#    new_sponsorship_level GET    /sponsorship_levels/new(.:format)      {:action=>"new", :controller=>"sponsorship_levels"}
#   edit_sponsorship_level GET    /sponsorship_levels/:id/edit(.:format) {:action=>"edit", :controller=>"sponsorship_levels"}
#        sponsorship_level GET    /sponsorship_levels/:id(.:format)      {:action=>"show", :controller=>"sponsorship_levels"}
#                          PUT    /sponsorship_levels/:id(.:format)      {:action=>"update", :controller=>"sponsorship_levels"}
#                          DELETE /sponsorship_levels/:id(.:format)      {:action=>"destroy", :controller=>"sponsorship_levels"}
#                 features GET    /features(.:format)                    {:action=>"index", :controller=>"features"}
#                          POST   /features(.:format)                    {:action=>"create", :controller=>"features"}
#              new_feature GET    /features/new(.:format)                {:action=>"new", :controller=>"features"}
#             edit_feature GET    /features/:id/edit(.:format)           {:action=>"edit", :controller=>"features"}
#                  feature GET    /features/:id(.:format)                {:action=>"show", :controller=>"features"}
#                          PUT    /features/:id(.:format)                {:action=>"update", :controller=>"features"}
#                          DELETE /features/:id(.:format)                {:action=>"destroy", :controller=>"features"}
#         new_user_session GET    /users/sign_in(.:format)               {:action=>"new", :controller=>"devise/sessions"}
#             user_session POST   /users/sign_in(.:format)               {:action=>"create", :controller=>"devise/sessions"}
#     destroy_user_session GET    /users/sign_out(.:format)              {:action=>"destroy", :controller=>"devise/sessions"}
#            user_password POST   /users/password(.:format)              {:action=>"create", :controller=>"devise/passwords"}
#        new_user_password GET    /users/password/new(.:format)          {:action=>"new", :controller=>"devise/passwords"}
#       edit_user_password GET    /users/password/edit(.:format)         {:action=>"edit", :controller=>"devise/passwords"}
#                          PUT    /users/password(.:format)              {:action=>"update", :controller=>"devise/passwords"}
# cancel_user_registration GET    /users/cancel(.:format)                {:action=>"cancel", :controller=>"devise/registrations"}
#        user_registration POST   /users(.:format)                       {:action=>"create", :controller=>"devise/registrations"}
#    new_user_registration GET    /users/sign_up(.:format)               {:action=>"new", :controller=>"devise/registrations"}
#   edit_user_registration GET    /users/edit(.:format)                  {:action=>"edit", :controller=>"devise/registrations"}
#                          PUT    /users(.:format)                       {:action=>"update", :controller=>"devise/registrations"}
#                          DELETE /users(.:format)                       {:action=>"destroy", :controller=>"devise/registrations"}
#        user_confirmation POST   /users/confirmation(.:format)          {:action=>"create", :controller=>"devise/confirmations"}
#    new_user_confirmation GET    /users/confirmation/new(.:format)      {:action=>"new", :controller=>"devise/confirmations"}
#                          GET    /users/confirmation(.:format)          {:action=>"show", :controller=>"devise/confirmations"}
#   accept_user_invitation GET    /users/invitation/accept(.:format)     {:action=>"edit", :controller=>"devise/invitations"}
#          user_invitation POST   /users/invitation(.:format)            {:action=>"create", :controller=>"devise/invitations"}
#      new_user_invitation GET    /users/invitation/new(.:format)        {:action=>"new", :controller=>"devise/invitations"}
#                          PUT    /users/invitation(.:format)            {:action=>"update", :controller=>"devise/invitations"}
#                   sesjas GET    /sessions(.:format)                    {:action=>"index", :controller=>"sesjas"}
#                          POST   /sessions(.:format)                    {:action=>"create", :controller=>"sesjas"}
#                new_sesja GET    /sessions/new(.:format)                {:action=>"new", :controller=>"sesjas"}
#               edit_sesja GET    /sessions/:id/edit(.:format)           {:action=>"edit", :controller=>"sesjas"}
#                    sesja GET    /sessions/:id(.:format)                {:action=>"show", :controller=>"sesjas"}
#                          PUT    /sessions/:id(.:format)                {:action=>"update", :controller=>"sesjas"}
#                          DELETE /sessions/:id(.:format)                {:action=>"destroy", :controller=>"sesjas"}
#                 contents GET    /contents(.:format)                    {:action=>"index", :controller=>"contents"}
#                          POST   /contents(.:format)                    {:action=>"create", :controller=>"contents"}
#              new_content GET    /contents/new(.:format)                {:action=>"new", :controller=>"contents"}
#             edit_content GET    /contents/:id/edit(.:format)           {:action=>"edit", :controller=>"contents"}
#                  content GET    /contents/:id(.:format)                {:action=>"show", :controller=>"contents"}
#                          PUT    /contents/:id(.:format)                {:action=>"update", :controller=>"contents"}
#                          DELETE /contents/:id(.:format)                {:action=>"destroy", :controller=>"contents"}
#                  imports GET    /imports(.:format)                     {:action=>"index", :controller=>"imports"}
#                          POST   /imports(.:format)                     {:action=>"create", :controller=>"imports"}
#               new_import GET    /imports/new(.:format)                 {:action=>"new", :controller=>"imports"}
#              edit_import GET    /imports/:id/edit(.:format)            {:action=>"edit", :controller=>"imports"}
#                   import GET    /imports/:id(.:format)                 {:action=>"show", :controller=>"imports"}
#                          PUT    /imports/:id(.:format)                 {:action=>"update", :controller=>"imports"}
#                          DELETE /imports/:id(.:format)                 {:action=>"destroy", :controller=>"imports"}
#                    users GET    /users(.:format)                       {:action=>"index", :controller=>"users"}
#                          POST   /users(.:format)                       {:action=>"create", :controller=>"users"}
#                 new_user GET    /users/new(.:format)                   {:action=>"new", :controller=>"users"}
#                edit_user GET    /users/:id/edit(.:format)              {:action=>"edit", :controller=>"users"}
#                     user GET    /users/:id(.:format)                   {:action=>"show", :controller=>"users"}
#                          PUT    /users/:id(.:format)                   {:action=>"update", :controller=>"users"}
#                          DELETE /users/:id(.:format)                   {:action=>"destroy", :controller=>"users"}
#                 speakers        /speakers(.:format)                    {:action=>"index", :controller=>"users"}
#         preregistrations GET    /preregistrations(.:format)            {:action=>"index", :controller=>"preregistrations"}
#                          POST   /preregistrations(.:format)            {:action=>"create", :controller=>"preregistrations"}
#              submissions GET    /submissions(.:format)                 {:action=>"index", :controller=>"submissions"}
#                          POST   /submissions(.:format)                 {:action=>"create", :controller=>"submissions"}
#           new_submission GET    /submissions/new(.:format)             {:action=>"new", :controller=>"submissions"}
#          edit_submission GET    /submissions/:id/edit(.:format)        {:action=>"edit", :controller=>"submissions"}
#               submission GET    /submissions/:id(.:format)             {:action=>"show", :controller=>"submissions"}
#                          PUT    /submissions/:id(.:format)             {:action=>"update", :controller=>"submissions"}
#                          DELETE /submissions/:id(.:format)             {:action=>"destroy", :controller=>"submissions"}
#                          GET    /contents(.:format)                    {:action=>"index", :controller=>"contents"}
#                          POST   /contents(.:format)                    {:action=>"create", :controller=>"contents"}
#                          GET    /contents/new(.:format)                {:action=>"new", :controller=>"contents"}
#                          GET    /contents/:id/edit(.:format)           {:action=>"edit", :controller=>"contents"}
#                          GET    /contents/:id(.:format)                {:action=>"show", :controller=>"contents"}
#                          PUT    /contents/:id(.:format)                {:action=>"update", :controller=>"contents"}
#                          DELETE /contents/:id(.:format)                {:action=>"destroy", :controller=>"contents"}
#              import_proc        /import/proc/:id(.:format)             {:action=>"proc_csv", :controller=>"imports"}
#                                 /:path(.:format)                       {:action=>"show", :controller=>"contents"}
#                     root        /(.:format)                            {:action=>"index", :controller=>"sesjas"}
