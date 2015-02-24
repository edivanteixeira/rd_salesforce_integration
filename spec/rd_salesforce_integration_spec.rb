require 'spec_helper'
#RdSalesforceIntegration::Config[:Connection] = @@salesforce_connection
#Restforce.log = true
@guid = SecureRandom.uuid
contact = Contact.new

describe RdSalesforceIntegration do
    it 'has a version number' do
    expect(RdSalesforceIntegration::VERSION).not_to be nil
  end
  
  it 'has connection with salesforce' do
    client = Restforce.new @@salesforce_connection
    expect(client).not_to be nil
    response = client.authenticate!
    expect(response).not_to be nil
  end
  
  it 'save a contact' do
    contact.name = @guid
    contact.website = "www.teste.com"
    contact.save
    expect(contact.id).to be >0
  end
  
  it 'test if has contact' do
    client = Restforce.new @@salesforce_connection
    result =client.select('Contato__c', contact.salesforce_id, ["Id"])
  end
end
