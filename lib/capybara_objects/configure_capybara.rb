# Allows the use of :ctype in a capybara finder spec
# the argument can either be a symbol, string or an array
# If a symbol or string, the component object is looked up by its ctype in the registry
# If an array, these are treated as multiple arguments, the first one being as above,
# and the remainder are passed on to the instance of the component object
Capybara.add_selector(:ctype) do
  xpath do |args|
    local_args = args
    local_args = [args] unless args.is_a? Array
    ctype, *other_args = local_args
    component = ::CapybaraObjects::RegistryInstance.instance.lookup_ctype(ctype).new(*other_args)
    query = ::Capybara::Query.new(*component.locator)
    selector = query.selector
    @format = selector.format
    if selector.format == :css
      @css = selector.css
      @xpath = nil
    else
      @xpath = selector.xpath
    end
    query.expression
  end
end