require "active_support/concern"
module CapybaraObjects
  module ConvenienceMethods
    extend ActiveSupport::Concern

    delegate :find, :within, to: :page
    # The capybara current session
    # @return [Capybara::Session] The current session
    def page
      Capybara.current_session
    end
    # Hovers over the root node of this component
    def hover
      root_node.hover
    end
    # Clicks on the root node of this component
    def click
      root_node.click
    end

  end
end