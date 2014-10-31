Dir.glob(File.join File.dirname(__FILE__), 'positron/**/*.rb') {|file| require file }

module Positron
  extend ActiveSupport::Concern

  def db
    self.class.send(:db).new
  end
end
