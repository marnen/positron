require 'spec_helper'

describe Positron do
  describe '.db' do
    it 'gets included into the host class' do
      host_class = Class.new
      host_class.class_eval { include Positron }

      host_class.should respond_to :db
    end
  end
end
