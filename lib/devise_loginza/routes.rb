# encoding: utf-8
ActionDispatch::Routing::Mapper.class_eval do
  protected

  def devise_loginza(mapping, controllers) #:nodoc:
    resource :session, :only => [], :controller => controllers[:loginza_sessions], :path => "" do
      match :loginza, :path => mapping.path_names[:loginza]
    end

  end

end
