require 'minitest_helper'

describe Positron do
  it 'has a version number' do
    ::Positron::VERSION.wont_be_nil
  end

  it 'does something useful' do
    true.must_equal false
  end
end