class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user=User.all
  end
  def show

  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end
end
