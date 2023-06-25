class ApplicationController < ActionController::Base
  before_action :set_classname

  def set_classname
    if params[:controller] == 'public/homes' && params[:action] == 'top'
      @classname = 'top-body'
    else
      @classname = 'top-except'
    end
  end

end