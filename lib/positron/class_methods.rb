module Positron::ClassMethods
  private

  def db(&block)
    @_db = Positron::DbClass.new self unless @_db
    @_db.class_eval &block if block_given?
    @_db
  end
end