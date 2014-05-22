require 'spec_helper'

describe Positron do
  describe '.included' do
    it "creates a new ActiveRecord class, accessible through the host class's .db method" do
      host_class = Class.new { include Positron }

      db_class = host_class.send(:db)
      db_class.should be_a_kind_of Class
      db_class.superclass.should == ActiveRecord::Base
    end
  end
end
