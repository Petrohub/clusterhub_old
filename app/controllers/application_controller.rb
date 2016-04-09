class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :require_login               

  def index
    @contact = current_user.contacts.all
  end
end




#class ApplicationSignedInController < ApplicationController
#  before_filter :require_login               
#end

#class ApplicationAdminController < ApplicationSignedInController
#  before_action :allowed?

#  def allowed?
#    if !current_user.admin?
#      redirect_to login_path, notice: 'You are not allowed'
#    end
#  end
#end
