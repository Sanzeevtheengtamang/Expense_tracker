require 'mysql2'

$client = Mysql2::Client.new(:host => "localhost", :username => "sanjeev", :password => 'S@njeev!23', :database => 'ExpenseTracker')
