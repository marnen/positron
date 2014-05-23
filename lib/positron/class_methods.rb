module Positron::ClassMethods
  private

  def db(&block)
    unless @_db
      @_db = Positron::DbClass.new
      @_db.instance_variable_set :@host_class, self
      @_db.class_eval do
        def self.table_name
          @host_class.name.to_s.underscore.pluralize
        end
      end
    end
    @_db.tap do
      if block_given?
        @_db.class_eval &block
      end
    end
  end
end