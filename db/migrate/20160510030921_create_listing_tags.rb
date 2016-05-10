class CreateListingTags < ActiveRecord::Migration
  def change
    create_table :listing_tags do |t|
      t.references :listings, index: true, null: false
      t.references :tags, index: true, null: false
      t.timestamps null: false
    end
  end
end
