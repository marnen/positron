require 'active_record'

module Positron::ClassMethods
  private

  def db
    unless @_db
      host_class = self
      @_db = Class.new ActiveRecord::Base
      @_db.class_eval "@host_class_name = '#{host_class.name}'"
      @_db.class_eval do
        def self.table_name
          @host_class_name.underscore.pluralize
        end
      end
    end
    @_db
  end
end