Rails.application.routes.draw do
  get 'env_versions/new'

  get 'env_versions/index'

  get 'env_versions/edit'

  get 'env_versions/update'

  get 'env_versions/delete'

  get 'env_versions/next'

  get 'env_versions/clone'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
