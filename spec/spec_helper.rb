$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rd_salesforce_integration'
require 'restforce'
require 'debugger'
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
                                       :database => File.dirname(__FILE__) + "/rd_salesforce_integration.sqlite3")
load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
load File.dirname(__FILE__) + '/support/connection_salesforce.rb'



