ActiveRecord::Schema.define do
  self.verbose = false

  create_table :contacts, :force => true do |t|
    t.string :name
    t.string :website
    t.string :company
    t.string :email
    t.string :phone
    t.string :last_name
    t.timestamps
  end
end