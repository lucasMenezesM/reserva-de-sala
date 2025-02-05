class PagesController < ApplicationController
  skip_before_action :is_institution_selected?, only: [:home]
  
  def home
  end

end
