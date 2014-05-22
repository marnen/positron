Dir.glob(File.join File.dirname(__FILE__), 'positron/**/*.rb') {|file| require file }

module Positron
  def self.included(base)
    base.extend Positron::ClassMethods
  end
end
