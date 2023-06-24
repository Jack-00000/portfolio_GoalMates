class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  #フォロー
  def followings
    user = User.find(params[:user_id])
    @users = user.followings.page(params[:page])
  end

  #フォロワー
  def followers
    user = User.find(params[:user_id])
    @users = user.followers.page(params[:page])
  end
end