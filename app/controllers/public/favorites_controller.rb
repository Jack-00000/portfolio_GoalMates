class Public::FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.favorites.find_or_create_by(post_id: @post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
end