class UsersController < ApplicationController

def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
end

 def my_friends
    @friendships= current_user.friends
 end

 def search
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @users = User.search(params[:search_param])
      @users = current_user.except_current_user(@users)
      flash.now[:danger] = "No users match this search criteria" if @users.blank?
    end
    render partial: 'friends/result'
  end
end