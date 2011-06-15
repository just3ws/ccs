Ccs::Application.routes.draw do
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

  devise_for :users
  resources :sesjas, :path => "sessions" do
    resources :comments
  end

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
# Generated on 18 May 2011 17:30
#
#                              posts GET    /posts(.:format)                                {:controller=>"posts", :action=>"index"}
#                                    POST   /posts(.:format)                                {:controller=>"posts", :action=>"create"}
#                           new_post GET    /posts/new(.:format)                            {:controller=>"posts", :action=>"new"}
#                          edit_post GET    /posts/:id/edit(.:format)                       {:controller=>"posts", :action=>"edit"}
#                               post GET    /posts/:id(.:format)                            {:controller=>"posts", :action=>"show"}
#                                    PUT    /posts/:id(.:format)                            {:controller=>"posts", :action=>"update"}
#                                    DELETE /posts/:id(.:format)                            {:controller=>"posts", :action=>"destroy"}
# notifications_speaker_notification GET    /notifications/speaker_notification(.:format)   {:controller=>"notifications", :action=>"speaker_notification"}
#  notification_speaker_notification GET    /notification/speaker_notification(.:format)    {:controller=>"notification", :action=>"speaker_notification"}
#                          schedules GET    /schedules(.:format)                            {:controller=>"schedules", :action=>"index"}
#                                    POST   /schedules(.:format)                            {:controller=>"schedules", :action=>"create"}
#                       new_schedule GET    /schedules/new(.:format)                        {:controller=>"schedules", :action=>"new"}
#                      edit_schedule GET    /schedules/:id/edit(.:format)                   {:controller=>"schedules", :action=>"edit"}
#                           schedule GET    /schedules/:id(.:format)                        {:controller=>"schedules", :action=>"show"}
#                                    PUT    /schedules/:id(.:format)                        {:controller=>"schedules", :action=>"update"}
#                                    DELETE /schedules/:id(.:format)                        {:controller=>"schedules", :action=>"destroy"}
#                                           /schedule(.:format)                             {:controller=>"schedules", :action=>"index"}
#                              rooms GET    /rooms(.:format)                                {:controller=>"rooms", :action=>"index"}
#                                    POST   /rooms(.:format)                                {:controller=>"rooms", :action=>"create"}
#                           new_room GET    /rooms/new(.:format)                            {:controller=>"rooms", :action=>"new"}
#                          edit_room GET    /rooms/:id/edit(.:format)                       {:controller=>"rooms", :action=>"edit"}
#                               room GET    /rooms/:id(.:format)                            {:controller=>"rooms", :action=>"show"}
#                                    PUT    /rooms/:id(.:format)                            {:controller=>"rooms", :action=>"update"}
#                                    DELETE /rooms/:id(.:format)                            {:controller=>"rooms", :action=>"destroy"}
#                         time_slots GET    /time_slots(.:format)                           {:controller=>"time_slots", :action=>"index"}
#                                    POST   /time_slots(.:format)                           {:controller=>"time_slots", :action=>"create"}
#                      new_time_slot GET    /time_slots/new(.:format)                       {:controller=>"time_slots", :action=>"new"}
#                     edit_time_slot GET    /time_slots/:id/edit(.:format)                  {:controller=>"time_slots", :action=>"edit"}
#                          time_slot GET    /time_slots/:id(.:format)                       {:controller=>"time_slots", :action=>"show"}
#                                    PUT    /time_slots/:id(.:format)                       {:controller=>"time_slots", :action=>"update"}
#                                    DELETE /time_slots/:id(.:format)                       {:controller=>"time_slots", :action=>"destroy"}
#                           sponsors GET    /sponsors(.:format)                             {:controller=>"sponsors", :action=>"index"}
#                                    POST   /sponsors(.:format)                             {:controller=>"sponsors", :action=>"create"}
#                        new_sponsor GET    /sponsors/new(.:format)                         {:controller=>"sponsors", :action=>"new"}
#                       edit_sponsor GET    /sponsors/:id/edit(.:format)                    {:controller=>"sponsors", :action=>"edit"}
#                            sponsor GET    /sponsors/:id(.:format)                         {:controller=>"sponsors", :action=>"show"}
#                                    PUT    /sponsors/:id(.:format)                         {:controller=>"sponsors", :action=>"update"}
#                                    DELETE /sponsors/:id(.:format)                         {:controller=>"sponsors", :action=>"destroy"}
#                 sponsorship_levels GET    /sponsorship_levels(.:format)                   {:controller=>"sponsorship_levels", :action=>"index"}
#                                    POST   /sponsorship_levels(.:format)                   {:controller=>"sponsorship_levels", :action=>"create"}
#              new_sponsorship_level GET    /sponsorship_levels/new(.:format)               {:controller=>"sponsorship_levels", :action=>"new"}
#             edit_sponsorship_level GET    /sponsorship_levels/:id/edit(.:format)          {:controller=>"sponsorship_levels", :action=>"edit"}
#                  sponsorship_level GET    /sponsorship_levels/:id(.:format)               {:controller=>"sponsorship_levels", :action=>"show"}
#                                    PUT    /sponsorship_levels/:id(.:format)               {:controller=>"sponsorship_levels", :action=>"update"}
#                                    DELETE /sponsorship_levels/:id(.:format)               {:controller=>"sponsorship_levels", :action=>"destroy"}
#                           features GET    /features(.:format)                             {:controller=>"features", :action=>"index"}
#                                    POST   /features(.:format)                             {:controller=>"features", :action=>"create"}
#                        new_feature GET    /features/new(.:format)                         {:controller=>"features", :action=>"new"}
#                       edit_feature GET    /features/:id/edit(.:format)                    {:controller=>"features", :action=>"edit"}
#                            feature GET    /features/:id(.:format)                         {:controller=>"features", :action=>"show"}
#                                    PUT    /features/:id(.:format)                         {:controller=>"features", :action=>"update"}
#                                    DELETE /features/:id(.:format)                         {:controller=>"features", :action=>"destroy"}
#                   new_user_session GET    /users/sign_in(.:format)                        {:controller=>"devise/sessions", :action=>"new"}
#                       user_session POST   /users/sign_in(.:format)                        {:controller=>"devise/sessions", :action=>"create"}
#               destroy_user_session GET    /users/sign_out(.:format)                       {:controller=>"devise/sessions", :action=>"destroy"}
#                      user_password POST   /users/password(.:format)                       {:controller=>"devise/passwords", :action=>"create"}
#                  new_user_password GET    /users/password/new(.:format)                   {:controller=>"devise/passwords", :action=>"new"}
#                 edit_user_password GET    /users/password/edit(.:format)                  {:controller=>"devise/passwords", :action=>"edit"}
#                                    PUT    /users/password(.:format)                       {:controller=>"devise/passwords", :action=>"update"}
#           cancel_user_registration GET    /users/cancel(.:format)                         {:controller=>"devise/registrations", :action=>"cancel"}
#                  user_registration POST   /users(.:format)                                {:controller=>"devise/registrations", :action=>"create"}
#              new_user_registration GET    /users/sign_up(.:format)                        {:controller=>"devise/registrations", :action=>"new"}
#             edit_user_registration GET    /users/edit(.:format)                           {:controller=>"devise/registrations", :action=>"edit"}
#                                    PUT    /users(.:format)                                {:controller=>"devise/registrations", :action=>"update"}
#                                    DELETE /users(.:format)                                {:controller=>"devise/registrations", :action=>"destroy"}
#                  user_confirmation POST   /users/confirmation(.:format)                   {:controller=>"devise/confirmations", :action=>"create"}
#              new_user_confirmation GET    /users/confirmation/new(.:format)               {:controller=>"devise/confirmations", :action=>"new"}
#                                    GET    /users/confirmation(.:format)                   {:controller=>"devise/confirmations", :action=>"show"}
#             accept_user_invitation GET    /users/invitation/accept(.:format)              {:controller=>"devise/invitations", :action=>"edit"}
#                    user_invitation POST   /users/invitation(.:format)                     {:controller=>"devise/invitations", :action=>"create"}
#                new_user_invitation GET    /users/invitation/new(.:format)                 {:controller=>"devise/invitations", :action=>"new"}
#                                    PUT    /users/invitation(.:format)                     {:controller=>"devise/invitations", :action=>"update"}
#                     sesja_comments GET    /sessions/:sesja_id/comments(.:format)          {:controller=>"comments", :action=>"index"}
#                                    POST   /sessions/:sesja_id/comments(.:format)          {:controller=>"comments", :action=>"create"}
#                  new_sesja_comment GET    /sessions/:sesja_id/comments/new(.:format)      {:controller=>"comments", :action=>"new"}
#                 edit_sesja_comment GET    /sessions/:sesja_id/comments/:id/edit(.:format) {:controller=>"comments", :action=>"edit"}
#                      sesja_comment GET    /sessions/:sesja_id/comments/:id(.:format)      {:controller=>"comments", :action=>"show"}
#                                    PUT    /sessions/:sesja_id/comments/:id(.:format)      {:controller=>"comments", :action=>"update"}
#                                    DELETE /sessions/:sesja_id/comments/:id(.:format)      {:controller=>"comments", :action=>"destroy"}
#                             sesjas GET    /sessions(.:format)                             {:controller=>"sesjas", :action=>"index"}
#                                    POST   /sessions(.:format)                             {:controller=>"sesjas", :action=>"create"}
#                          new_sesja GET    /sessions/new(.:format)                         {:controller=>"sesjas", :action=>"new"}
#                         edit_sesja GET    /sessions/:id/edit(.:format)                    {:controller=>"sesjas", :action=>"edit"}
#                              sesja GET    /sessions/:id(.:format)                         {:controller=>"sesjas", :action=>"show"}
#                                    PUT    /sessions/:id(.:format)                         {:controller=>"sesjas", :action=>"update"}
#                                    DELETE /sessions/:id(.:format)                         {:controller=>"sesjas", :action=>"destroy"}
#                           contents GET    /contents(.:format)                             {:controller=>"contents", :action=>"index"}
#                                    POST   /contents(.:format)                             {:controller=>"contents", :action=>"create"}
#                        new_content GET    /contents/new(.:format)                         {:controller=>"contents", :action=>"new"}
#                       edit_content GET    /contents/:id/edit(.:format)                    {:controller=>"contents", :action=>"edit"}
#                            content GET    /contents/:id(.:format)                         {:controller=>"contents", :action=>"show"}
#                                    PUT    /contents/:id(.:format)                         {:controller=>"contents", :action=>"update"}
#                                    DELETE /contents/:id(.:format)                         {:controller=>"contents", :action=>"destroy"}
#                            imports GET    /imports(.:format)                              {:controller=>"imports", :action=>"index"}
#                                    POST   /imports(.:format)                              {:controller=>"imports", :action=>"create"}
#                         new_import GET    /imports/new(.:format)                          {:controller=>"imports", :action=>"new"}
#                        edit_import GET    /imports/:id/edit(.:format)                     {:controller=>"imports", :action=>"edit"}
#                             import GET    /imports/:id(.:format)                          {:controller=>"imports", :action=>"show"}
#                                    PUT    /imports/:id(.:format)                          {:controller=>"imports", :action=>"update"}
#                                    DELETE /imports/:id(.:format)                          {:controller=>"imports", :action=>"destroy"}
#                              users GET    /users(.:format)                                {:controller=>"users", :action=>"index"}
#                                    POST   /users(.:format)                                {:controller=>"users", :action=>"create"}
#                           new_user GET    /users/new(.:format)                            {:controller=>"users", :action=>"new"}
#                          edit_user GET    /users/:id/edit(.:format)                       {:controller=>"users", :action=>"edit"}
#                               user GET    /users/:id(.:format)                            {:controller=>"users", :action=>"show"}
#                                    PUT    /users/:id(.:format)                            {:controller=>"users", :action=>"update"}
#                                    DELETE /users/:id(.:format)                            {:controller=>"users", :action=>"destroy"}
#                           speakers        /speakers(.:format)                             {:controller=>"users", :action=>"index"}
#                   preregistrations GET    /preregistrations(.:format)                     {:controller=>"preregistrations", :action=>"index"}
#                                    POST   /preregistrations(.:format)                     {:controller=>"preregistrations", :action=>"create"}
#                        submissions GET    /submissions(.:format)                          {:controller=>"submissions", :action=>"index"}
#                                    POST   /submissions(.:format)                          {:controller=>"submissions", :action=>"create"}
#                     new_submission GET    /submissions/new(.:format)                      {:controller=>"submissions", :action=>"new"}
#                    edit_submission GET    /submissions/:id/edit(.:format)                 {:controller=>"submissions", :action=>"edit"}
#                         submission GET    /submissions/:id(.:format)                      {:controller=>"submissions", :action=>"show"}
#                                    PUT    /submissions/:id(.:format)                      {:controller=>"submissions", :action=>"update"}
#                                    DELETE /submissions/:id(.:format)                      {:controller=>"submissions", :action=>"destroy"}
#                                    GET    /contents(.:format)                             {:controller=>"contents", :action=>"index"}
#                                    POST   /contents(.:format)                             {:controller=>"contents", :action=>"create"}
#                                    GET    /contents/new(.:format)                         {:controller=>"contents", :action=>"new"}
#                                    GET    /contents/:id/edit(.:format)                    {:controller=>"contents", :action=>"edit"}
#                                    GET    /contents/:id(.:format)                         {:controller=>"contents", :action=>"show"}
#                                    PUT    /contents/:id(.:format)                         {:controller=>"contents", :action=>"update"}
#                                    DELETE /contents/:id(.:format)                         {:controller=>"contents", :action=>"destroy"}
#                        import_proc        /import/proc/:id(.:format)                      {:controller=>"imports", :action=>"proc_csv"}
#                                           /:path(.:format)                                {:controller=>"contents", :action=>"show"}
#                               root        /(.:format)                                     {:controller=>"sesjas", :action=>"index"}
