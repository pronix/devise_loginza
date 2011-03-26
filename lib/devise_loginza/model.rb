# encoding: utf-8
module Devise
  module Models
    module LoginzaAuthenticatable
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        ::Devise::Models.config(self, :loginza_auto_register)
      end
    end
  end
end
