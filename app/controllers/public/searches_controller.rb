class Public::SearchesController < ApplicationController

  before_action :authenticate_user!
  # 非公開ユーザの非表示
  def search
    @content = params[:content]
    @users = User.active_user.search_for(@content).page(params[:page])
    released_user_ids = User.where(status: :released).or(User.where(id: current_user.id)).pluck(:id)
    @posts = Post.where(user_id: released_user_ids).search_for(@content).page(params[:page])
  end

end