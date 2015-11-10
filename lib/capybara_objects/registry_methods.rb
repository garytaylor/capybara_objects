require "active_support/concern"
require "capybara_objects/registry_instance"
module CapybaraObjects
  module RegistryMethods
    extend ActiveSupport::Concern
    included do
      private
      cattr_accessor :registry
      self.registry = RegistryInstance.instance
    end
    class_methods do
      private

    end
  end
end