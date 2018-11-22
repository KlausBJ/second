class DbVersionsController < ApplicationController
  def new
    #
  end

  def index
    #
  end

  def edit
    # db_version
  end

  def update
    # db_version
  end

  def delete
    # db_version
  end

  def next
    # db_version
  end

  def clone
    # db_version, name
  end

  private

  def app_params
    params.require(:db_version).permit(:name)
  end
end
