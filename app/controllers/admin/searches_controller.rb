class Admin::SearchesController < ApplicationController

  before_action :authenticate_admin!

#キーワード検索
  def search
    @content = params[:content]
    @users = User.search_for(@content).page(params[:page])
    @posts = Post.search_for(@content).page(params[:page])
  end

end