class AddColumnToCity < ActiveRecord::Migration
  def change
  	add_column :cities, :city_img, :string
  end
end
