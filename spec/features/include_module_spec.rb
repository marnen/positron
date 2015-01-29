require 'spec_helper'

describe 'include Positron' do
  describe 'class method inclusion' do
    it 'includes Positron::ClassMethods in the host class' do
      host_class = Class.new
      expect(host_class).to receive(:extend).with(Positron::ClassMethods)
      host_class.class_eval { include Positron }
    end
  end
end