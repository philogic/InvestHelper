class UsersController < ApplicationController
  def my_stocks
    @user_stocks = current_user.stocks
  end

  def my_friends
    @friendships = current_user.friends
  end
end
