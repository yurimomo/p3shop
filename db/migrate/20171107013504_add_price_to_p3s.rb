class AddPriceToP3s < ActiveRecord::Migration
  def change
    add_column :p3s, :price, :integer
  end
end
