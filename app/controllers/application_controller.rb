class ApplicationController < ActionController::Base
  # ログインしていない場合、トップ画面とアバウト画面以外の表示を制限
  # before_action :authenticate_customer!, except: [:top, :about]
  # ユーザー登録時と編集時にそれぞれ必要な項目の指定
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしていない場合は投稿内容やユーザー情報の編集ができない
  # before_action :is_matching_login_customer, only: [:edit, :update]

  private

  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
          admin_root_path
      else
          items_path(resource)
      end
  end

  def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
          root_path
      elsif resource_or_scope == :admin
          new_admin_session_path
      else
          root_path
      end
  end

  protected

  def configure_permitted_parameters
    # ユーザー登録時と編集時にそれぞれ必要な項目の指定
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

end
