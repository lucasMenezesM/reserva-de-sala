class ApplicationController < ActionController::Base
  before_action :is_institution_selected?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/401', alert: exception.message
  end
  
  def is_institution_selected?
    if current_user && Institution.all.count == 1
      current_user.update(institution: Institution.first)
    end

    if current_user && !current_user.institution.present?
      flash[:alert] = "You need to select a institution to proceed!"
      redirect_to institutions_path
    end
  end

  def only_admin!
    return if current_user.profile == "admin"

    redirect_to root_path, alert: "You don't have permission to access this resource!"
  end

end
