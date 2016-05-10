class ChangeColumnNamesOfListingTags < ActiveRecord::Migration
  def change
    rename_column :listing_tags, :listings_id, :listing_id
    rename_column :listing_tags, :tags_id, :tag_id
  end
end
