class ApplicationController < ActionController::Base

  before_filter :set_locale
  def set_locale
    # If params[:locale] is nil then I18n.default_locale will be used
    # Set I18n.default_locale in config/application.rb
    I18n.locale = params[:locale]
  end

   protect_from_forgery

end
