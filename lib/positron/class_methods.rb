require 'active_record'

module Positron::ClassMethods
  def db
    @_db = Class.new ActiveRecord::Base
  end
end