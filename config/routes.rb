Rails.application.routes.draw do

  root "task_lists#index"

  # Rotas para TaskLists
  get "/task_lists/:id", to: "task_lists#show", as: :task_list
  post "/task_list", to: "task_lists#create", as: :task_lists
  #get "/blog_posts/:new", to: "blog_posts#new", as: :new_blog_post
  #patch "blog_posts/:id", to: "blog_posts#update"
  #delete "/blog_posts/:id", to: "blog_posts#destroy"
  #get "/blog_posts/:id/:edit/", to: "blog_posts#edit", as: :edit_blog_post

  # Rotas para Tasks
  post "/task_lists/:task_list_id/tasks", to: "tasks#create", as: :task_list_tasks
  get "/task_lists/:task_list_id/tasks/:id/edit", to: "tasks#edit", as: :edit_task_list_task
  patch "/task_lists/:task_list_id/tasks/:id", to: "tasks#update", as: :task_list_task
  delete "/task_lists/:task_list_id/tasks/:id", to: "tasks#destroy"
end
