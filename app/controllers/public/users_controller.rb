class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.active_user.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to  mypage_path
      flash[:notice] = "編集が成功しました"
    else
      render :edit
    end
  end

  def confirm_deleted
    @user = current_user
  end

  def is_deleted
    @user = current_user
    @user.update(status: 2)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def mypage
    @user = current_user
     @posts = @user.posts.page(params[:page]).per(6)
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :status)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:alert] = "他ユーザーのプロフィール編集画面には遷移できません"
      redirect_to user_path(current_user.id)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      flash[:notice] = "ゲストユーザーはプロフィール編集画面へ遷移できません"
      redirect_to user_path(current_user)
    end
  end

end
