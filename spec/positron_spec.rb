require 'spec_helper'

describe Positron do
  describe '#db' do
    let(:host_class) { Class.new { include Positron } }
    let(:host) { host_class.new }

    it 'is private' do
      host.should_not respond_to :db
    end

    it 'returns an object of the wrapped ActiveRecord class' do
      db_class = host_class.send :db
      host.send(:db).class.should == db_class
    end

    it 'returns the same object each time' do
      host.send(:db).should equal host.send(:db)
    end
  end
end