require 'spec_helper'

module Positron
  describe DbClass do
    describe '.new' do
      it 'should create an ActiveRecord subclass' do
        db_class = DbClass.new
        db_class.should be_a_kind_of Class
        db_class.new.should be_a_kind_of ActiveRecord::Base
      end
    end
  end
end