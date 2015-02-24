
module RdSalesforceIntegration

  extend ActiveSupport::Concern
  
  
  module ClassMethods
    @@fields  = []
    @@salesforce_entity_name = ''
    @@conection = []
    
    
    def set_salesforce_autheticate(options={})
     @@conection = options
    end
    
    
    def save_salesforce_field(entity_name, custom, fields=[] )
      salesforce_entity_name(entity_name, custom)
      
      
      @@fields = fields
      
      module_eval do
        after_save :save_salesforce
        attr_accessor :salesforce_id
        def save_salesforce
          begin
            #@@connection = RdSalesforceIntegration::Config.Connection if not @@conection.has_value?('')
            client = Restforce.new @@conection
            obj = {}
            @@fields.each do |field|
              
              if self[field[:local_field]]
                if field.has_key?(:custom) and not field[:custom].nil? and field[:custom] == true
                  obj[field[:salesforce_field].to_s + '__c'] = self[field[:local_field]]
                else
                  obj[field[:salesforce_field]] = self[field[:local_field]]
                end
              end
            end
            result =client.create(@@salesforce_entity_name,obj)
            self.salesforce_id = result
          rescue   Exception => e
            logger.debug e.message
          end
        end
      end
    end
  
    protected  
    def salesforce_entity_name(entity_name, custom =false)
      @@salesforce_entity_name = entity_name + ('__c' if custom)
    end
  end

end
ActiveRecord::Base.send(:include, RdSalesforceIntegration)