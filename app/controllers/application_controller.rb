class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  layout 'admin', only: [:new, :edit]

  def default_url_options
    { locale: I18n.locale }
  end 

  def after_sign_in_path_for(resource)
    request.referrer
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
 
private
  def extract_locale_from_accept_language_header
    http_accept_language = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    if ['fr', 'en'].include? http_accept_language
      http_accept_language
    else
      'en'
    end
  end

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
    @other_language = ([:fr, :en] - [I18n.locale]).first
  end
end
