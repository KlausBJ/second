Rails.application.routes.draw do
  get 'env_versions/new'

  get 'env_versions/index'

  get 'env_versions/edit'

  get 'env_versions/update'

  get 'env_versions/delete'

  get 'env_versions/next'

  get 'env_versions/clone'

  get 'app_versions/new'

  get 'app_versions/index'

  get 'app_versions/edit'

  get 'app_versions/update'

  get 'app_versions/delete'

  get 'app_versions/next'

  get 'app_versions/clone'

  get 'db_versions/new'

  get 'db_versions/index'

  get 'db_versions/edit'

  get 'db_versions/update'

  get 'db_versions/delete'

  get 'db_versions/next'

  get 'db_versions/clone'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
