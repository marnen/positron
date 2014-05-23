require "codeclimate-test-reporter"
CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

Bundler.require :default, :development
Dir.glob(File.join File.dirname(__FILE__), 'support/**/*.rb') {|file| require file }

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'positron'
