class ErrorsController < ApplicationController
  skip_before_action :is_institution_selected?

  def not_found
    render status: :not_found
  end

  def unauthorized
    render status: :unauthorized
  end

  def internal_server_error
    render status: :internal_server_error
  end

end
