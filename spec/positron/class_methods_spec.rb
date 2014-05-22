require 'spec_helper'

describe Positron::ClassMethods do
  describe '.db' do
    it 'returns a new ActiveRecord class' do
      host_class = Class.new { extend Positron::ClassMethods }

      db_class = host_class.send(:db)
      db_class.should be_a_kind_of Class
      db_class.superclass.should == ActiveRecord::Base
    end
  end
end