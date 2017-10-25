class AddPictureToP3s < ActiveRecord::Migration
  def change
    add_column :p3s, :picture, :string
  end
end
