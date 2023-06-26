class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    ##サイドバーにソート機能を実装
    #sort_indexメソッドはモデルに記述
    @posts = Post.sort_index(params[:sort]).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to admin_root_path
  end

end
