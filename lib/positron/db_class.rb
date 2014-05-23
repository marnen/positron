require 'active_record'

class Positron::DbClass
  def self.new
    Class.new ActiveRecord::Base
  end
end