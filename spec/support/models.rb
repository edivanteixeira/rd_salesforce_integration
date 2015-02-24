load File.dirname(__FILE__) + '/connection_salesforce.rb'
class Contact < ActiveRecord::Base
  save_salesforce_field 'Contato', true, [{:local_field=> :name, :salesforce_field=> :name} ,{:local_field=> :website, :salesforce_field=> :website, :custom=>true}]
  set_salesforce_autheticate @@salesforce_connection
end