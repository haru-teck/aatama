class ApplicationController < ActionController::Base
  helper_method :current_patient
  before_action :authenticate_user!, except: [:new, :create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    main_menu_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def current_patient
    @current_patient ||= current_user.patients.find_by(id: session[:selected_patient_id]) if session[:selected_patient_id]
  end
end