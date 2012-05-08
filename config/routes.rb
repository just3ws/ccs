Ccs::Application.routes.draw do

  devise_for :users, :path_prefix => 'd'
  resources :users
  match 'speakers' => 'users#index'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  match '/admin' => 'admin_home#index'

  resources :posts

  get "notifications/speaker_notification"
  get "notification/speaker_notification"

  resources :schedules
  match '/schedule' => "schedules#index"

  resources :rooms

  resources :time_slots

  resources :sponsors

  resources :sponsorship_levels

  resources :features

  resources :sesjas, :path => "sessions" do
    resources :comments
  end

  resources :contents
  resources :imports
  resources :preregistrations, :only => [:create, :index]

  match '/submissions/accept/:id', controller: "submissions", action: "accept"
  match '/submissions/reject/:id', controller: "submissions", action: "reject"
  resources :submissions


  match '/import/proc/:id' => 'imports#proc_csv', :as => :import_proc

  match '/:path' => 'contents#show' # this needs to be the last non-default route

  root :to => 'sesjas#index'
  #root :to => 'submissions#new'
  #root :to => "contents#show"

end
#== Route Map
# Generated on 10 Feb 2012 09:40
#
#                       user_session POST       /d/users/sign_in(.:format)                      {:action=>"create", :controller=>"devise/sessions"}
#               destroy_user_session DELETE     /d/users/sign_out(.:format)                     {:action=>"destroy", :controller=>"devise/sessions"}
#                      user_password POST       /d/users/password(.:format)                     {:action=>"create", :controller=>"devise/passwords"}
#                  new_user_password GET        /d/users/password/new(.:format)                 {:action=>"new", :controller=>"devise/passwords"}
#                 edit_user_password GET        /d/users/password/edit(.:format)                {:action=>"edit", :controller=>"devise/passwords"}
#                                    PUT        /d/users/password(.:format)                     {:action=>"update", :controller=>"devise/passwords"}
#           cancel_user_registration GET        /d/users/cancel(.:format)                       {:action=>"cancel", :controller=>"devise/registrations"}
#                  user_registration POST       /d/users(.:format)                              {:action=>"create", :controller=>"devise/registrations"}
#              new_user_registration GET        /d/users/sign_up(.:format)                      {:action=>"new", :controller=>"devise/registrations"}
#             edit_user_registration GET        /d/users/edit(.:format)                         {:action=>"edit", :controller=>"devise/registrations"}
#                                    PUT        /d/users(.:format)                              {:action=>"update", :controller=>"devise/registrations"}
#                                    DELETE     /d/users(.:format)                              {:action=>"destroy", :controller=>"devise/registrations"}
#                  user_confirmation POST       /d/users/confirmation(.:format)                 {:action=>"create", :controller=>"devise/confirmations"}
#              new_user_confirmation GET        /d/users/confirmation/new(.:format)             {:action=>"new", :controller=>"devise/confirmations"}
#                                    GET        /d/users/confirmation(.:format)                 {:action=>"show", :controller=>"devise/confirmations"}
#             accept_user_invitation GET        /d/users/invitation/accept(.:format)            {:action=>"edit", :controller=>"devise/invitations"}
#                    user_invitation POST       /d/users/invitation(.:format)                   {:action=>"create", :controller=>"devise/invitations"}
#                new_user_invitation GET        /d/users/invitation/new(.:format)               {:action=>"new", :controller=>"devise/invitations"}
#                                    PUT        /d/users/invitation(.:format)                   {:action=>"update", :controller=>"devise/invitations"}
#                              users GET        /users(.:format)                                {:action=>"index", :controller=>"users"}
#                                    POST       /users(.:format)                                {:action=>"create", :controller=>"users"}
#                           new_user GET        /users/new(.:format)                            {:action=>"new", :controller=>"users"}
#                          edit_user GET        /users/:id/edit(.:format)                       {:action=>"edit", :controller=>"users"}
#                               user GET        /users/:id(.:format)                            {:action=>"show", :controller=>"users"}
#                                    PUT        /users/:id(.:format)                            {:action=>"update", :controller=>"users"}
#                                    DELETE     /users/:id(.:format)                            {:action=>"destroy", :controller=>"users"}
#                           speakers            /speakers(.:format)                             {:action=>"index", :controller=>"users"}
#                    admin_dashboard            /admin(.:format)                                {:action=>"index", :controller=>"admin/dashboard"}
#                     admin_contents GET        /admin/contents(.:format)                       {:action=>"index", :controller=>"admin/contents"}
#                                    POST       /admin/contents(.:format)                       {:action=>"create", :controller=>"admin/contents"}
#                  new_admin_content GET        /admin/contents/new(.:format)                   {:action=>"new", :controller=>"admin/contents"}
#                 edit_admin_content GET        /admin/contents/:id/edit(.:format)              {:action=>"edit", :controller=>"admin/contents"}
#                      admin_content GET        /admin/contents/:id(.:format)                   {:action=>"show", :controller=>"admin/contents"}
#                                    PUT        /admin/contents/:id(.:format)                   {:action=>"update", :controller=>"admin/contents"}
#                                    DELETE     /admin/contents/:id(.:format)                   {:action=>"destroy", :controller=>"admin/contents"}
#                     admin_features GET        /admin/features(.:format)                       {:action=>"index", :controller=>"admin/features"}
#                                    POST       /admin/features(.:format)                       {:action=>"create", :controller=>"admin/features"}
#                  new_admin_feature GET        /admin/features/new(.:format)                   {:action=>"new", :controller=>"admin/features"}
#                 edit_admin_feature GET        /admin/features/:id/edit(.:format)              {:action=>"edit", :controller=>"admin/features"}
#                      admin_feature GET        /admin/features/:id(.:format)                   {:action=>"show", :controller=>"admin/features"}
#                                    PUT        /admin/features/:id(.:format)                   {:action=>"update", :controller=>"admin/features"}
#                                    DELETE     /admin/features/:id(.:format)                   {:action=>"destroy", :controller=>"admin/features"}
#                        admin_posts GET        /admin/posts(.:format)                          {:action=>"index", :controller=>"admin/posts"}
#                                    POST       /admin/posts(.:format)                          {:action=>"create", :controller=>"admin/posts"}
#                     new_admin_post GET        /admin/posts/new(.:format)                      {:action=>"new", :controller=>"admin/posts"}
#                    edit_admin_post GET        /admin/posts/:id/edit(.:format)                 {:action=>"edit", :controller=>"admin/posts"}
#                         admin_post GET        /admin/posts/:id(.:format)                      {:action=>"show", :controller=>"admin/posts"}
#                                    PUT        /admin/posts/:id(.:format)                      {:action=>"update", :controller=>"admin/posts"}
#                                    DELETE     /admin/posts/:id(.:format)                      {:action=>"destroy", :controller=>"admin/posts"}
#                        admin_rooms GET        /admin/rooms(.:format)                          {:action=>"index", :controller=>"admin/rooms"}
#                                    POST       /admin/rooms(.:format)                          {:action=>"create", :controller=>"admin/rooms"}
#                     new_admin_room GET        /admin/rooms/new(.:format)                      {:action=>"new", :controller=>"admin/rooms"}
#                    edit_admin_room GET        /admin/rooms/:id/edit(.:format)                 {:action=>"edit", :controller=>"admin/rooms"}
#                         admin_room GET        /admin/rooms/:id(.:format)                      {:action=>"show", :controller=>"admin/rooms"}
#                                    PUT        /admin/rooms/:id(.:format)                      {:action=>"update", :controller=>"admin/rooms"}
#                                    DELETE     /admin/rooms/:id(.:format)                      {:action=>"destroy", :controller=>"admin/rooms"}
#                    admin_schedules GET        /admin/schedules(.:format)                      {:action=>"index", :controller=>"admin/schedules"}
#                                    POST       /admin/schedules(.:format)                      {:action=>"create", :controller=>"admin/schedules"}
#                 new_admin_schedule GET        /admin/schedules/new(.:format)                  {:action=>"new", :controller=>"admin/schedules"}
#                edit_admin_schedule GET        /admin/schedules/:id/edit(.:format)             {:action=>"edit", :controller=>"admin/schedules"}
#                     admin_schedule GET        /admin/schedules/:id(.:format)                  {:action=>"show", :controller=>"admin/schedules"}
#                                    PUT        /admin/schedules/:id(.:format)                  {:action=>"update", :controller=>"admin/schedules"}
#                                    DELETE     /admin/schedules/:id(.:format)                  {:action=>"destroy", :controller=>"admin/schedules"}
#                       admin_sesjas GET        /admin/sesjas(.:format)                         {:action=>"index", :controller=>"admin/sesjas"}
#                                    POST       /admin/sesjas(.:format)                         {:action=>"create", :controller=>"admin/sesjas"}
#                    new_admin_sesja GET        /admin/sesjas/new(.:format)                     {:action=>"new", :controller=>"admin/sesjas"}
#                   edit_admin_sesja GET        /admin/sesjas/:id/edit(.:format)                {:action=>"edit", :controller=>"admin/sesjas"}
#                        admin_sesja GET        /admin/sesjas/:id(.:format)                     {:action=>"show", :controller=>"admin/sesjas"}
#                                    PUT        /admin/sesjas/:id(.:format)                     {:action=>"update", :controller=>"admin/sesjas"}
#                                    DELETE     /admin/sesjas/:id(.:format)                     {:action=>"destroy", :controller=>"admin/sesjas"}
#                     admin_sponsors GET        /admin/sponsors(.:format)                       {:action=>"index", :controller=>"admin/sponsors"}
#                                    POST       /admin/sponsors(.:format)                       {:action=>"create", :controller=>"admin/sponsors"}
#                  new_admin_sponsor GET        /admin/sponsors/new(.:format)                   {:action=>"new", :controller=>"admin/sponsors"}
#                 edit_admin_sponsor GET        /admin/sponsors/:id/edit(.:format)              {:action=>"edit", :controller=>"admin/sponsors"}
#                      admin_sponsor GET        /admin/sponsors/:id(.:format)                   {:action=>"show", :controller=>"admin/sponsors"}
#                                    PUT        /admin/sponsors/:id(.:format)                   {:action=>"update", :controller=>"admin/sponsors"}
#                                    DELETE     /admin/sponsors/:id(.:format)                   {:action=>"destroy", :controller=>"admin/sponsors"}
#           admin_sponsorship_levels GET        /admin/sponsorship_levels(.:format)             {:action=>"index", :controller=>"admin/sponsorship_levels"}
#                                    POST       /admin/sponsorship_levels(.:format)             {:action=>"create", :controller=>"admin/sponsorship_levels"}
#        new_admin_sponsorship_level GET        /admin/sponsorship_levels/new(.:format)         {:action=>"new", :controller=>"admin/sponsorship_levels"}
#       edit_admin_sponsorship_level GET        /admin/sponsorship_levels/:id/edit(.:format)    {:action=>"edit", :controller=>"admin/sponsorship_levels"}
#            admin_sponsorship_level GET        /admin/sponsorship_levels/:id(.:format)         {:action=>"show", :controller=>"admin/sponsorship_levels"}
#                                    PUT        /admin/sponsorship_levels/:id(.:format)         {:action=>"update", :controller=>"admin/sponsorship_levels"}
#                                    DELETE     /admin/sponsorship_levels/:id(.:format)         {:action=>"destroy", :controller=>"admin/sponsorship_levels"}
#                  admin_submissions GET        /admin/submissions(.:format)                    {:action=>"index", :controller=>"admin/submissions"}
#                                    POST       /admin/submissions(.:format)                    {:action=>"create", :controller=>"admin/submissions"}
#               new_admin_submission GET        /admin/submissions/new(.:format)                {:action=>"new", :controller=>"admin/submissions"}
#              edit_admin_submission GET        /admin/submissions/:id/edit(.:format)           {:action=>"edit", :controller=>"admin/submissions"}
#                   admin_submission GET        /admin/submissions/:id(.:format)                {:action=>"show", :controller=>"admin/submissions"}
#                                    PUT        /admin/submissions/:id(.:format)                {:action=>"update", :controller=>"admin/submissions"}
#                                    DELETE     /admin/submissions/:id(.:format)                {:action=>"destroy", :controller=>"admin/submissions"}
#                   admin_time_slots GET        /admin/time_slots(.:format)                     {:action=>"index", :controller=>"admin/time_slots"}
#                                    POST       /admin/time_slots(.:format)                     {:action=>"create", :controller=>"admin/time_slots"}
#                new_admin_time_slot GET        /admin/time_slots/new(.:format)                 {:action=>"new", :controller=>"admin/time_slots"}
#               edit_admin_time_slot GET        /admin/time_slots/:id/edit(.:format)            {:action=>"edit", :controller=>"admin/time_slots"}
#                    admin_time_slot GET        /admin/time_slots/:id(.:format)                 {:action=>"show", :controller=>"admin/time_slots"}
#                                    PUT        /admin/time_slots/:id(.:format)                 {:action=>"update", :controller=>"admin/time_slots"}
#                                    DELETE     /admin/time_slots/:id(.:format)                 {:action=>"destroy", :controller=>"admin/time_slots"}
#                        admin_users GET        /admin/users(.:format)                          {:action=>"index", :controller=>"admin/users"}
#                                    POST       /admin/users(.:format)                          {:action=>"create", :controller=>"admin/users"}
#                     new_admin_user GET        /admin/users/new(.:format)                      {:action=>"new", :controller=>"admin/users"}
#                    edit_admin_user GET        /admin/users/:id/edit(.:format)                 {:action=>"edit", :controller=>"admin/users"}
#                         admin_user GET        /admin/users/:id(.:format)                      {:action=>"show", :controller=>"admin/users"}
#                                    PUT        /admin/users/:id(.:format)                      {:action=>"update", :controller=>"admin/users"}
#                                    DELETE     /admin/users/:id(.:format)                      {:action=>"destroy", :controller=>"admin/users"}
#                     admin_comments GET        /admin/comments(.:format)                       {:action=>"index", :controller=>"admin/comments"}
#                                    POST       /admin/comments(.:format)                       {:action=>"create", :controller=>"admin/comments"}
#                  new_admin_comment GET        /admin/comments/new(.:format)                   {:action=>"new", :controller=>"admin/comments"}
#                 edit_admin_comment GET        /admin/comments/:id/edit(.:format)              {:action=>"edit", :controller=>"admin/comments"}
#                      admin_comment GET        /admin/comments/:id(.:format)                   {:action=>"show", :controller=>"admin/comments"}
#                                    PUT        /admin/comments/:id(.:format)                   {:action=>"update", :controller=>"admin/comments"}
#                                    DELETE     /admin/comments/:id(.:format)                   {:action=>"destroy", :controller=>"admin/comments"}
#             new_admin_user_session GET        /admin/login(.:format)                          {:action=>"new", :controller=>"active_admin/devise/sessions"}
#                 admin_user_session POST       /admin/login(.:format)                          {:action=>"create", :controller=>"active_admin/devise/sessions"}
#         destroy_admin_user_session DELETE|GET /admin/logout(.:format)                         {:action=>"destroy", :controller=>"active_admin/devise/sessions"}
#                admin_user_password POST       /admin/password(.:format)                       {:action=>"create", :controller=>"active_admin/devise/passwords"}
#            new_admin_user_password GET        /admin/password/new(.:format)                   {:action=>"new", :controller=>"active_admin/devise/passwords"}
#           edit_admin_user_password GET        /admin/password/edit(.:format)                  {:action=>"edit", :controller=>"active_admin/devise/passwords"}
#                                    PUT        /admin/password(.:format)                       {:action=>"update", :controller=>"active_admin/devise/passwords"}
#                              admin            /admin(.:format)                                {:controller=>"admin_home", :action=>"index"}
#                              posts GET        /posts(.:format)                                {:action=>"index", :controller=>"posts"}
#                                    POST       /posts(.:format)                                {:action=>"create", :controller=>"posts"}
#                           new_post GET        /posts/new(.:format)                            {:action=>"new", :controller=>"posts"}
#                          edit_post GET        /posts/:id/edit(.:format)                       {:action=>"edit", :controller=>"posts"}
#                               post GET        /posts/:id(.:format)                            {:action=>"show", :controller=>"posts"}
#                                    PUT        /posts/:id(.:format)                            {:action=>"update", :controller=>"posts"}
#                                    DELETE     /posts/:id(.:format)                            {:action=>"destroy", :controller=>"posts"}
# notifications_speaker_notification GET        /notifications/speaker_notification(.:format)   {:controller=>"notifications", :action=>"speaker_notification"}
#  notification_speaker_notification GET        /notification/speaker_notification(.:format)    {:controller=>"notification", :action=>"speaker_notification"}
#                          schedules GET        /schedules(.:format)                            {:action=>"index", :controller=>"schedules"}
#                                    POST       /schedules(.:format)                            {:action=>"create", :controller=>"schedules"}
#                       new_schedule GET        /schedules/new(.:format)                        {:action=>"new", :controller=>"schedules"}
#                      edit_schedule GET        /schedules/:id/edit(.:format)                   {:action=>"edit", :controller=>"schedules"}
#                           schedule GET        /schedules/:id(.:format)                        {:action=>"show", :controller=>"schedules"}
#                                    PUT        /schedules/:id(.:format)                        {:action=>"update", :controller=>"schedules"}
#                                    DELETE     /schedules/:id(.:format)                        {:action=>"destroy", :controller=>"schedules"}
#                                               /schedule(.:format)                             {:controller=>"schedules", :action=>"index"}
#                              rooms GET        /rooms(.:format)                                {:action=>"index", :controller=>"rooms"}
#                                    POST       /rooms(.:format)                                {:action=>"create", :controller=>"rooms"}
#                           new_room GET        /rooms/new(.:format)                            {:action=>"new", :controller=>"rooms"}
#                          edit_room GET        /rooms/:id/edit(.:format)                       {:action=>"edit", :controller=>"rooms"}
#                               room GET        /rooms/:id(.:format)                            {:action=>"show", :controller=>"rooms"}
#                                    PUT        /rooms/:id(.:format)                            {:action=>"update", :controller=>"rooms"}
#                                    DELETE     /rooms/:id(.:format)                            {:action=>"destroy", :controller=>"rooms"}
#                         time_slots GET        /time_slots(.:format)                           {:action=>"index", :controller=>"time_slots"}
#                                    POST       /time_slots(.:format)                           {:action=>"create", :controller=>"time_slots"}
#                      new_time_slot GET        /time_slots/new(.:format)                       {:action=>"new", :controller=>"time_slots"}
#                     edit_time_slot GET        /time_slots/:id/edit(.:format)                  {:action=>"edit", :controller=>"time_slots"}
#                          time_slot GET        /time_slots/:id(.:format)                       {:action=>"show", :controller=>"time_slots"}
#                                    PUT        /time_slots/:id(.:format)                       {:action=>"update", :controller=>"time_slots"}
#                                    DELETE     /time_slots/:id(.:format)                       {:action=>"destroy", :controller=>"time_slots"}
#                           sponsors GET        /sponsors(.:format)                             {:action=>"index", :controller=>"sponsors"}
#                                    POST       /sponsors(.:format)                             {:action=>"create", :controller=>"sponsors"}
#                        new_sponsor GET        /sponsors/new(.:format)                         {:action=>"new", :controller=>"sponsors"}
#                       edit_sponsor GET        /sponsors/:id/edit(.:format)                    {:action=>"edit", :controller=>"sponsors"}
#                            sponsor GET        /sponsors/:id(.:format)                         {:action=>"show", :controller=>"sponsors"}
#                                    PUT        /sponsors/:id(.:format)                         {:action=>"update", :controller=>"sponsors"}
#                                    DELETE     /sponsors/:id(.:format)                         {:action=>"destroy", :controller=>"sponsors"}
#                 sponsorship_levels GET        /sponsorship_levels(.:format)                   {:action=>"index", :controller=>"sponsorship_levels"}
#                                    POST       /sponsorship_levels(.:format)                   {:action=>"create", :controller=>"sponsorship_levels"}
#              new_sponsorship_level GET        /sponsorship_levels/new(.:format)               {:action=>"new", :controller=>"sponsorship_levels"}
#             edit_sponsorship_level GET        /sponsorship_levels/:id/edit(.:format)          {:action=>"edit", :controller=>"sponsorship_levels"}
#                  sponsorship_level GET        /sponsorship_levels/:id(.:format)               {:action=>"show", :controller=>"sponsorship_levels"}
#                                    PUT        /sponsorship_levels/:id(.:format)               {:action=>"update", :controller=>"sponsorship_levels"}
#                                    DELETE     /sponsorship_levels/:id(.:format)               {:action=>"destroy", :controller=>"sponsorship_levels"}
#                           features GET        /features(.:format)                             {:action=>"index", :controller=>"features"}
#                                    POST       /features(.:format)                             {:action=>"create", :controller=>"features"}
#                        new_feature GET        /features/new(.:format)                         {:action=>"new", :controller=>"features"}
#                       edit_feature GET        /features/:id/edit(.:format)                    {:action=>"edit", :controller=>"features"}
#                            feature GET        /features/:id(.:format)                         {:action=>"show", :controller=>"features"}
#                                    PUT        /features/:id(.:format)                         {:action=>"update", :controller=>"features"}
#                                    DELETE     /features/:id(.:format)                         {:action=>"destroy", :controller=>"features"}
#                     sesja_comments GET        /sessions/:sesja_id/comments(.:format)          {:action=>"index", :controller=>"comments"}
#                                    POST       /sessions/:sesja_id/comments(.:format)          {:action=>"create", :controller=>"comments"}
#                  new_sesja_comment GET        /sessions/:sesja_id/comments/new(.:format)      {:action=>"new", :controller=>"comments"}
#                 edit_sesja_comment GET        /sessions/:sesja_id/comments/:id/edit(.:format) {:action=>"edit", :controller=>"comments"}
#                      sesja_comment GET        /sessions/:sesja_id/comments/:id(.:format)      {:action=>"show", :controller=>"comments"}
#                                    PUT        /sessions/:sesja_id/comments/:id(.:format)      {:action=>"update", :controller=>"comments"}
#                                    DELETE     /sessions/:sesja_id/comments/:id(.:format)      {:action=>"destroy", :controller=>"comments"}
#                             sesjas GET        /sessions(.:format)                             {:action=>"index", :controller=>"sesjas"}
#                                    POST       /sessions(.:format)                             {:action=>"create", :controller=>"sesjas"}
#                          new_sesja GET        /sessions/new(.:format)                         {:action=>"new", :controller=>"sesjas"}
#                         edit_sesja GET        /sessions/:id/edit(.:format)                    {:action=>"edit", :controller=>"sesjas"}
#                              sesja GET        /sessions/:id(.:format)                         {:action=>"show", :controller=>"sesjas"}
#                                    PUT        /sessions/:id(.:format)                         {:action=>"update", :controller=>"sesjas"}
#                                    DELETE     /sessions/:id(.:format)                         {:action=>"destroy", :controller=>"sesjas"}
#                           contents GET        /contents(.:format)                             {:action=>"index", :controller=>"contents"}
#                                    POST       /contents(.:format)                             {:action=>"create", :controller=>"contents"}
#                        new_content GET        /contents/new(.:format)                         {:action=>"new", :controller=>"contents"}
#                       edit_content GET        /contents/:id/edit(.:format)                    {:action=>"edit", :controller=>"contents"}
#                            content GET        /contents/:id(.:format)                         {:action=>"show", :controller=>"contents"}
#                                    PUT        /contents/:id(.:format)                         {:action=>"update", :controller=>"contents"}
#                                    DELETE     /contents/:id(.:format)                         {:action=>"destroy", :controller=>"contents"}
#                            imports GET        /imports(.:format)                              {:action=>"index", :controller=>"imports"}
#                                    POST       /imports(.:format)                              {:action=>"create", :controller=>"imports"}
#                         new_import GET        /imports/new(.:format)                          {:action=>"new", :controller=>"imports"}
#                        edit_import GET        /imports/:id/edit(.:format)                     {:action=>"edit", :controller=>"imports"}
#                             import GET        /imports/:id(.:format)                          {:action=>"show", :controller=>"imports"}
#                                    PUT        /imports/:id(.:format)                          {:action=>"update", :controller=>"imports"}
#                                    DELETE     /imports/:id(.:format)                          {:action=>"destroy", :controller=>"imports"}
#                   preregistrations GET        /preregistrations(.:format)                     {:action=>"index", :controller=>"preregistrations"}
#                                    POST       /preregistrations(.:format)                     {:action=>"create", :controller=>"preregistrations"}
#                        submissions GET        /submissions(.:format)                          {:action=>"index", :controller=>"submissions"}
#                                    POST       /submissions(.:format)                          {:action=>"create", :controller=>"submissions"}
#                     new_submission GET        /submissions/new(.:format)                      {:action=>"new", :controller=>"submissions"}
#                    edit_submission GET        /submissions/:id/edit(.:format)                 {:action=>"edit", :controller=>"submissions"}
#                         submission GET        /submissions/:id(.:format)                      {:action=>"show", :controller=>"submissions"}
#                                    PUT        /submissions/:id(.:format)                      {:action=>"update", :controller=>"submissions"}
#                                    DELETE     /submissions/:id(.:format)                      {:action=>"destroy", :controller=>"submissions"}
#                                    GET        /contents(.:format)                             {:action=>"index", :controller=>"contents"}
#                                    POST       /contents(.:format)                             {:action=>"create", :controller=>"contents"}
#                                    GET        /contents/new(.:format)                         {:action=>"new", :controller=>"contents"}
#                                    GET        /contents/:id/edit(.:format)                    {:action=>"edit", :controller=>"contents"}
#                                    GET        /contents/:id(.:format)                         {:action=>"show", :controller=>"contents"}
#                                    PUT        /contents/:id(.:format)                         {:action=>"update", :controller=>"contents"}
#                                    DELETE     /contents/:id(.:format)                         {:action=>"destroy", :controller=>"contents"}
#                        import_proc            /import/proc/:id(.:format)                      {:controller=>"imports", :action=>"proc_csv"}
#                                               /:path(.:format)                                {:controller=>"contents", :action=>"show"}
#                               root            /(.:format)                                     {:controller=>"submissions", :action=>"new"}
