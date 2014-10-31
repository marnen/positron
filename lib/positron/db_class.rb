require 'active_record'

class Positron::DbClass
  def self.new(host_class)
    Class.new(ActiveRecord::Base).tap do |db_class|
      db_class.instance_variable_set :@host_class, host_class
      db_class.class_eval do
        def self.table_name
          @host_class.name.to_s.underscore.pluralize
        end
      end
    end
  end
end