require 'active_record'

module Positron::ClassMethods
  private

  def db
    unless @_db
      @_db = Class.new ActiveRecord::Base
      @_db.instance_variable_set :@host_class, self
      @_db.class_eval do
        def self.table_name
          @host_class.name.to_s.underscore.pluralize
        end
      end
    end
    @_db
  end
end