require "active_support/concern"
require "capybara_objects/registry_instance"
module CapybaraObjects
  module LocationMethods
    extend ActiveSupport::Concern
    included do |base|
      class_attribute :default_locator
      attr_accessor :locator, :scope
    end

    def initialize(attrs = {})
      self.locator = default_locator
      self.scope = []
      super
      locator.freeze
    end

    class_methods do
      def locator(*args)
        self.default_locator = args
      end
    end

  end
end