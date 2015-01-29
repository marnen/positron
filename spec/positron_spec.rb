require 'spec_helper'

describe Positron do
  describe '#db' do
    let(:host_class) { Class.new { include Positron } }
    let(:host) { host_class.new }

    it 'is private' do
      expect(host).not_to respond_to :db
    end

    it 'returns an object of the wrapped ActiveRecord class' do
      db_class = host_class.send :db
      expect(host.send(:db).class).to be == db_class
    end

    it 'returns the same object each time' do
      expect(host.send(:db)).to equal host.send(:db)
    end
  end
end