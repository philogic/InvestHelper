class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
  def my_stocks
    @user_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    @users = User.search(params[:search_param])
    if @users
      @users = current_user.not_me(@users)
      render partial: 'friends/form'
    else
      render status: :not_found, nothing: true
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)

    if current_user.save
      redirect_to my_friends_path, notice: 'Friend added'
    else
      redirect_to my_friends_path, flash[:error] = 'Some problems occured, friend was not added'
    end
  end

end
