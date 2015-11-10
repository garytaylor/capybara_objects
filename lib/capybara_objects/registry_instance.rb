module CapybaraObjects
  class RegistryInstance
    include Singleton
    def initialize
      self.ctypes = HashWithIndifferentAccess.new
      self.ptypes = HashWithIndifferentAccess.new
    end

    #
    # Registers a component class so an alias can be used rather than worrying about
    # the module path etc..
    # @param [String] type The type of component to register
    # @param [Class] klass The class to register
    def register_ctype(type, klass)
      ctypes[type] = klass
    end

    # @TODO Raise exceptions if ptype or ctype not found

    #
    # Registers a page object class so an alias can be used rather than worrying about
    # the module path etc..
    # @param [String] type The type of page object to register
    # @param [Class] klass The class to register
    # @raise ::CapybaraObjects::Exceptions::UnregisteredType
    def register_ptype(type, klass)
      ptypes[type] = klass
    end

    # Lookup a component object by its type
    # @param [String] ctype The component type to lookup
    # @return [Class] The registered class
    # @raise ::CapybaraObjects::Exceptions::TypeNotRegistered
    def lookup_ctype(ctype)
      ctypes[ctype] or raise Exceptions::TypeNotRegistered.new(ctype)
    end

    # Lookup a page object by its type
    # @param [String] ptype The page object type to lookup
    # @return [Class] The registered class
    # @raise ::CapybaraObjects::Exceptions::TypeNotRegistered
    def lookup_ptype(ptype)
      ptypes[ptype] or raise Exceptions::TypeNotRegistered.new(ptype)
    end


    private
    attr_accessor :ctypes, :ptypes
  end
end