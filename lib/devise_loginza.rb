# encoding: utf-8
require 'devise'

require 'devise_loginza/loginza'
require 'devise_loginza/strategy'
require 'devise_loginza/routes'
require 'devise_loginza/view_helpers'

module DeviseLoginza
  class Engine < Rails::Engine
  end

  class ServerError < RuntimeError; end
  class ServiceUnavailableError < ServerError; end
end

module Devise
  mattr_accessor :loginza_auto_register
end

Devise.add_module :loginza_authenticatable,
                  :strategy => true,
                  :model => 'devise_loginza/model',
                  :controller => :loginza_sessions,
                  :route => :loginza


