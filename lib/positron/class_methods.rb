module Positron::ClassMethods
  private

  def db(&block)
    host_class = self
    @_db = Positron::DbClass.new host_class unless @_db
    @_db.tap do
      if block_given?
        @_db.class_eval &block
      end
    end
  end
end