class AddPostcodeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :postcode, :integer
  end
end
