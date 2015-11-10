require "active_support/concern"
module CapybaraObjects
  module ScopedFinders
    extend ActiveSupport::Concern

    # Fetch a component from within this component
    # @TODO Make this operate within the scope
    # @TODO Pass the scope on to any found instances
    # @param [String|Symbol] ctype The component alias to find
    # @param [Any] args Any further arguments are passed on to the instance of the component
    # @return [CapybaraObjects::ComponentObject] An instance inheriting from the component object
    def get_component(ctype, *args)
      registry.lookup_ctype(ctype).new(*args).tap do |comp|
        comp.scope = full_scope
        comp.validate!
      end
    end

    def root_node
      within_parent_scope do
        find(*locator)
      end
    end

    # Finds a node within the scope of this component
    # @param [Any] args - All args get passed on to the normal capybara find method
    # @return [Capybara::Node] The found node
    def scoped_find(*args)
      within_my_scope do
        find(*args)
      end
    end



    private

    def full_scope
      scope + [locator]
    end

    def within_my_scope(current_scope = full_scope, &blk)
      next_scope = current_scope.shift
      if next_scope
        within(*next_scope) do
          within_my_scope(current_scope, &blk)
        end
      else
        yield
      end
    end

    def within_parent_scope(&blk)
      within_my_scope(scope.dup, &blk)
    end
  end
end