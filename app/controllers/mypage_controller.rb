class MypageController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def update
  end

  def profile
  
  end

  def card
  end

  def identification
    @user = User.find(current_user.id)
  end

  def logout
  end
end
