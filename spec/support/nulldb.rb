require 'nulldb_rspec'
include NullDB::RSpec::NullifiedDatabase
NullDB.configure {|ndb| def ndb.project_root;File.dirname(__FILE__);end} # see https://github.com/nulldb/nulldb/issues/18
