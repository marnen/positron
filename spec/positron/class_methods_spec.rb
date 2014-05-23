require 'spec_helper'

describe Positron::ClassMethods do
  describe '.db' do
    let(:host_class) { Class.new { extend Positron::ClassMethods } }

    it 'is private' do
      host_class.should_not respond_to :db
    end

    context 'ActiveRecord attributes' do
      let(:db) { host_class.send :db }

      it 'returns a new ActiveRecord class' do
        db.should be_a_kind_of Class
        db.new.should be_a_kind_of ActiveRecord::Base
      end

      it 'memoizes the class for future calls' do
        db2 = host_class.send :db
        db.should == db2
      end

      it 'sets the table name from the host class' do
        class_name = Faker::Lorem.words(2).map(&:titleize).join
        host_class.stub name: class_name

        db.table_name.should == class_name.underscore.pluralize
      end
    end
  end
end