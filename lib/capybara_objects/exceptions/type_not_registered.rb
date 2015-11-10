module CapybaraObjects
  module Exceptions
    class TypeNotRegistered < StandardError
      attr_accessor :type
      def initialize(type)
        self.type = type
      end

      def to_s
        "Type not registered in CapybaraObjects::RegistryInstance (#{type})"
      end

    end
  end
end