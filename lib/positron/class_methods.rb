require 'active_record'

module Positron::ClassMethods
  private

  def db
    @_db = Class.new ActiveRecord::Base
  end
end