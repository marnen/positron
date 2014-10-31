require 'spec_helper'

describe Positron do
  describe '#db' do
    it 'returns an object of the wrapped ActiveRecord class' do
      host_class = Class.new { include Positron }
      db_class = host_class.send :db
      host_class.new.db.class.should == db_class
    end
  end
end