require 'spec_helper'

describe Positron::ClassMethods do
  describe '.db' do
    let(:host_class) { Class.new { extend Positron::ClassMethods } }
    let(:db) { host_class.send :db }

    it 'is private' do
      expect(host_class).not_to respond_to :db
    end

    context 'ActiveRecord attributes' do
      it 'returns a new ActiveRecord class' do
        expect(db).to be_a_kind_of Class
        expect(db.new).to be_a_kind_of ActiveRecord::Base
      end

      it 'memoizes the class for future calls' do
        db2 = host_class.send :db
        expect(db).to be == db2
      end

      it 'sets the table name from the host class' do
        class_name = Faker::Lorem.words(2).map(&:titleize).join
        allow(host_class).to receive(:name).and_return class_name

        expect(db.table_name).to be == class_name.underscore.pluralize
      end
    end

    context 'block syntax' do
      it 'evaluates the block in the context of the ActiveRecord class' do
        expect(db).to receive(:foo).with :bar
        host_class.class_eval do
          db do
            foo :bar
          end
        end
      end
    end
  end
end