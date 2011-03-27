Devise << Loginze
=================

http://loginza.ru/api-overview

Dependencies
------------
  httparty
  json
  devise

Installation
-----------
Add to Gemfile
    gem "devise_loginza",  :git => "git://github.com/pronix/devise_loginza.git"

Usage
-----
  Frame:
     <%= loginza_frame_tag(loginza_user_session_url, { :providers => [:google, :yandex, :mailru, :vkontakte, :facebook, :twitter] },
                                                { :style => "width:400px;height:350px;" }) %>
  Button:
     <%= loginza_button_tag("Login via OpenID", loginza_user_session_url, :providers => [ :google, :facebook, :twitter ]) %>

Auto Registration
-----------------

  config/initializers/devise.rb
    Devise.setup do |config|
      config.loginza_auto_register = true
    end

  User.rb
    class << self
      def create_from_loginza(data)
         ... create user ...
         ... and return user ...
      end
    end