class Public::HomesController < ApplicationController

  before_action :admin_exists?, only: [:top]


  def top
    released_user_ids = User.where(status: :released).or(User.where(id: current_user&.id)).pluck(:id)
    @posts = Post.where(user_id: released_user_ids)
    @posts = @posts.eager_load(:favorites).group('posts.id').order('count(favorites.post_id) DESC')
    @posts = Post.page(params[:page])
  end

  def about
  end

private
  #管理者がログインしているときに、ユーザーのrootパスに行けてしまうを防ぐため
  def admin_exists?
    if admin_signed_in?
      redirect_to admin_root_path
    end
  end

end