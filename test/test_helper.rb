require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/spec'
require './lib/event_manager'
require './lib/attendee'
require './lib/phone_number'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
