class AppVersionsController < ApplicationController
  def new
    #
  end

  def index
    #
  end

  def edit
    # app_version
  end

  def update
    # app_version
  end

  def delete
    # app_version
  end

  def next
    # app_version
  end

  def clone
    # app_version, name
  end

  private

  def app_params
    params.require(:app_version).permit(:name)
  end
end
