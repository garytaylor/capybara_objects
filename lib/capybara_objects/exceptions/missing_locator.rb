module CapybaraObjects
  module Exceptions
    class MissingLocator < StandardError
      def to_s
        "CapybaraObjects::Exceptions::MissingLocator - Please ensure either a default_locator (class level) or a locator (instance level) has been declared"
      end
    end
  end
end