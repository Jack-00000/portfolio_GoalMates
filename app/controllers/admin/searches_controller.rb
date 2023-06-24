class Admin::SearchesController < ApplicationController
   
  before_action :authenticate_admin!

  def search
    @content = params[:content]
    @users = User.search_for(@content).page(params[:page])
    @posts = Post.search_for(@content).page(params[:page])
  end

end