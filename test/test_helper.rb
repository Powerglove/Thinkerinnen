require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
 
  fixtures :all

  def assert_permit(user, record, action)
	  msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
	  assert permit(user, record, action), msg
	end

	def refute_permit(user, record, action)
	  msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
	  refute permit(user, record, action), msg
	end



	def permit(user, record, action)
  test_name = self.class.ancestors.select { |a| a.to_s.match(/PolicyTest/) }.first
  klass = test_name.to_s.gsub(/Test/, '')
  klass.constantize.new(user, record).public_send("#{action.to_s}?")
	end
	
end
