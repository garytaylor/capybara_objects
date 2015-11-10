require "rspec/core"
require "capybara_objects/rspec/helpers"
::RSpec.configure do |config|
  config.include CapybaraObjects::RSpec::Helpers::FeatureHelpers, :type => :feature

end