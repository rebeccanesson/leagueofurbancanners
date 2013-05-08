class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_session_user, :load_cms_site
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  private 

  def set_session_user
     User.session_current_user = current_user if current_user
  end

  def load_cms_site
    @cms_site ||= if params[:site_id]
      Cms::Site.find_by_id(params[:site_id])
    else
      Cms::Site.find_site(request.host_with_port.downcase, request.fullpath)
    end
    
    if @cms_site
      if params[:cms_path].present?
        params[:cms_path].gsub!(/^#{@cms_site.path}/, '')
        params[:cms_path].to_s.gsub!(/^\//, '')
      end
      I18n.locale = @cms_site.locale
    else
      I18n.locale = I18n.default_locale
      raise ActionController::RoutingError.new('Site Not Found')
    end
  end
  
end
