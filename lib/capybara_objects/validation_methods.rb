require "active_support/concern"
require "capybara_objects/registry_instance"
require "capybara_objects/exceptions/missing_locator"
module CapybaraObjects
  module ValidationMethods
    extend ActiveSupport::Concern
    # Validates that the component exists
    # this is simply done by searching for the root node.
    # However, a sub class may implement its own stricter
    # validation if required.
    # @raise CapybaraObjects::Exceptions::MissingLocator If a locator hasn't been defined using default_locator or locator (instance)
    def validate!
      raise Exceptions::MissingLocator unless locator.present?
      root_node.present?
    end

  end
end