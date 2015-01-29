require 'spec_helper'

module Positron
  describe DbClass do
    describe '.new' do
      it 'creates an ActiveRecord subclass' do
        db_class = DbClass.new Class.new
        expect(db_class).to be_a_kind_of Class
        expect(db_class.new).to be_a_kind_of ActiveRecord::Base
      end

      it 'sets the table name from the host class argument' do
        host_class = Class.new
        class_name = Faker::Lorem.words(2).map(&:titleize).join
        allow(host_class).to receive(:name).and_return class_name

        expect(DbClass.new(host_class).table_name).to be == class_name.underscore.pluralize
      end
    end
  end
end