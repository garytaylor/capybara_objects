require "capybara_objects/registry_instance"
module CapybaraObjects
  module RSpec
    module Helpers
      module FeatureHelpers

        # Fetches a page object instance by its alias
        # @param [String] ptype The page object type to lookup
        # @param [*] args Any extra params are passed to the instance of the looked up class
        # @return [::CapybaraObjects::PageObject] A new page object instance
        def page_object_for(ptype, *args)
          ::CapybaraObjects::RegistryInstance.instance.lookup_ptype(ptype).new(*args)
        end

        # Fetches a component object instance by its alias
        # @param [String] ctype The component object type to lookup
        # @param [*] args Any extra params are passed to the instance of the looked up class
        # @return [::CapybaraObjects::ComponentObject] A new component object instance
        def component_object_for(ctype, *args)
          ::CapybaraObjects::RegistryInstance.instance.lookup_ctype(ctype, *args).tap do |instance|
            instance.validate!
          end
        end
      end
    end
  end
end