class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    # Redirecionar para a página de erro personalizada
    redirect_to '/401', alert: exception.message
  end
  
end
