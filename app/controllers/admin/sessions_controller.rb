# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :user_exists?, only: [:new]
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def user_exists?
    if user_signed_in?
      redirect_to root_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
