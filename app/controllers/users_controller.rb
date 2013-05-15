class UsersController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def show
    @current_user = current_user
  end
  
end
