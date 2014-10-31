require 'spec_helper'

module Positron
  describe DbClass do
    describe '.new' do
      it 'creates an ActiveRecord subclass' do
        db_class = DbClass.new Class.new
        db_class.should be_a_kind_of Class
        db_class.new.should be_a_kind_of ActiveRecord::Base
      end

      it 'sets the table name from the host class argument' do
        host_class = Class.new
        class_name = Faker::Lorem.words(2).map(&:titleize).join
        host_class.stub name: class_name

        DbClass.new(host_class).table_name.should == class_name.underscore.pluralize
      end
    end
  end
end