ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
#require 'webrat'
#require 'webrat/core/matchers'
require 'integration_tests_helper'

Webrat.configure do |config|
  config.mode = :rails
end

class ActiveSupport::TestCase

  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

  fixtures :all
end
