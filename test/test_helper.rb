# frozen_string_literal: true

require 'test/unit'
require 'simplecov'
SimpleCov.start { add_filter %r{^/test/} }

##
# Module to include in tests that provides helper functions.
module TestHelper
end
