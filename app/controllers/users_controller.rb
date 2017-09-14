class UsersController < ApplicationController
  def my_stocks
    @user_stocks = current_user.stocks
  end

  def my_friends
    @friendships = current_user.friends
  end

  # def search_friends; end

  # def add_friend; end

end
