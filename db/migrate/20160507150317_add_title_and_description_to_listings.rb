class AddTitleAndDescriptionToListings < ActiveRecord::Migration
  def change
    add_column :listings, :title, :string
    add_column :listings, :description, :text
  end
end
