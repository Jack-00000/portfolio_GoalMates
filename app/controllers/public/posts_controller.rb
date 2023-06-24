class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @posts = Post.page(params[:page])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集に成功しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
private

  def post_params
    params.require(:post).permit(:image, :shop_name, :address, :latitude, :longitude, :menu, :impression, :price, :volume_status, :star)
  end