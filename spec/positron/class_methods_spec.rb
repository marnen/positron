require 'spec_helper'

describe Positron::ClassMethods do
  describe '.db' do
    let(:host_class) { Class.new { extend Positron::ClassMethods } }

    it 'is private' do
      host_class.should_not respond_to :db
    end

    it 'returns a new ActiveRecord class' do
      db_class = host_class.send(:db)
      db_class.should be_a_kind_of Class
      db_class.superclass.should == ActiveRecord::Base
    end
  end
end