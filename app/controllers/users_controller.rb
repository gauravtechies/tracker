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

  def add_friend
  
     @FriendInfo =User.find( params[:friend])
      @createFriend=current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = "You have added #{@FriendInfo.first_name}  successfull as your friend"
    else
      flash[:danger] = "Some thing wrong happend"
    end

    redirect_to my_friends_path
  end 

  def friendship_path(friend)
    current_user.friendships.destroy(friend)
    flash[:danger] = "Sucessfully removed from your Friends"
    redirect_to my_friends_path

  end 
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end

end