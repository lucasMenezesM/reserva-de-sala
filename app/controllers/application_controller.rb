class ApplicationController < ActionController::Base
  before_action :is_institution_selected?

  rescue_from CanCan::AccessDenied do |exception|
    # Redirecionar para a página de erro personalizada
    redirect_to '/401', alert: exception.message
  end
  
  def is_institution_selected?
    if current_user && !current_user.institution.present?
      flash[:alert] = "You need to select a institution to proceed!"
      redirect_to institutions_path
    end
  end
end
