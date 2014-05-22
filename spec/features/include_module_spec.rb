require 'spec_helper'

describe 'include Positron' do
  describe 'class method inclusion' do
    it 'includes Positron::ClassMethods in the host class' do
      host_class = Class.new
      host_class.should_receive(:extend).with(Positron::ClassMethods)
      host_class.class_eval { include Positron }
    end
  end
end