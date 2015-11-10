module CapybaraObjects
  module Exceptions
    class MissingUrl < StandardError
      def to_s
        "CapybaraObjects::Exceptions::MissingUrl - Please ensure either a default_url (class level) or a url (instance level) has been declared"
      end
    end
  end
end