require "active_support/concern"
module CapybaraObjects
  module InitializeMethods
    extend ActiveSupport::Concern
    included do
      private

      attr_accessor :options

    end

    def initialize(options = {})
      my_options = options.dup
      my_options.keys.each do |key|
        if respond_to?("#{key}=".to_sym)
          send("#{key}=", my_options.delete(key))
        end
      end
      self.options = my_options
    end
  end
end