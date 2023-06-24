class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @content = params[:content]
    @users = User.active_user.search_for(@content).page(params[:page])
    released_user_ids = User.where(status: :released).pluck(:id)
    released_user_ids.push(current_user.id).uniq! if current_user
    @posts = Post.where(user_id: released_user_ids).search_for(@content).page(params[:page])
  end
  
end