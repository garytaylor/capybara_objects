require "capybara_objects/registry_methods"
require "capybara_objects/initialize_methods"
require "capybara_objects/scoped_finders"
require "capybara_objects/location_methods"
require "capybara_objects/validation_methods"
require "capybara_objects/convenience_methods"
module CapybaraObjects
  class ComponentObject
    include RegistryMethods
    include InitializeMethods
    include LocationMethods
    include ValidationMethods
    include ConvenienceMethods
    include ScopedFinders
    class << self
      def ctype(type)
        registry.register_ctype type, self
      end
    end


  end
end