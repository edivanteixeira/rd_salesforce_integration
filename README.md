# RdSalesforceIntegration

This gem lets you send data from one model to an entity 's salesforce

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rd_salesforce_integration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rd_salesforce_integration

## Usage

Insert in your model as properts
```ruby
class Contact < ActiveRecord::Base
  save_salesforce_field 'Contato', true, [{:local_field=> :name, :salesforce_field=> :name} ,{:local_field=> :website, :salesforce_field=> :website, :custom=>true}]
  set_salesforce_autheticate {:username => 'foo@force.com',
    :password       => 'password',
    :security_token => 'token',
    :client_id      => 'casdasda2342342',
    :client_secret  => '1234566'}
end
```
The method require a Name of entity, if a entity is custom entity, and array with mappings of fields :
```ruby

[]{:local_field=> :name, :salesforce_field=> :name}]
```
local_field is name of property to model
salesforce_field is name of property in salesforce