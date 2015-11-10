require "capybara_objects/registry_methods"
require "capybara_objects/initialize_methods"
require "capybara_objects/scoped_finders"
require "capybara_objects/location_methods"
require "capybara_objects/validation_methods"
require "capybara_objects/convenience_methods"
module CapybaraObjects
  #
  # A page object
  #
  class PageObject
    include RegistryMethods
    include InitializeMethods
    include LocationMethods
    include ValidationMethods
    include ConvenienceMethods
    include ScopedFinders
    attr_accessor :url
    class << self
      # Registers a "ptype" alias for this class
      # @param [String] type The alias or type to register this class with.
      def ptype(type)
        registry.register_ptype type, self
      end

      # Defines the default url. Can be overriden in the instance
      # @param [String] url The default url
      def url(url)
        self.default_url = url
      end
    end

    def initialize(options = {})
      super
      self.url ||= default_url
    end

    # Visits the pre configured URL to make this page available
    # @raise ::CapybaraPageObjects::Exceptions::MissingUrl
    # @return [::CapybaraObjects::PageObject] self - allows chaining of methods
    def visit
      raise ::CapybaraObjects::Exceptions::MissingUrl unless url.present?
      page.visit url
      validate!
      self
    end

    # Attaches the page object to the current page
    # @return [::CapybaraObjects::PageObject] self - allows chaining of methods
    def attach(options = {})
      validate!
      self
    end

    private
    cattr_accessor :default_url


  end
end