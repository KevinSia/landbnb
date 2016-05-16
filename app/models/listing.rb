class Listing < ActiveRecord::Base

  mount_uploaders :images, ImagesUploader

  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  has_many :reservations

  before_save :modify_country

  HOME_TYPE = [
    ['Apartment', '0'],
    ['House', '1'],
    ['Bed & Breakfast', '2']
  ]

  enum home_type: {
    'Apartment': '0',
    'House': '1',
    'Bed & Breakfast': '2'
  }

  ROOM_TYPE = [
    ['Entire home/apartment', '0'],
    ['Private room', '1'],
    ['Shared room', '2']
  ]

  enum room_type: {
    'Entire home/apartment': '0',
    'Private room': '1',
    'Shared room': '2'
  }

  def tags_list=(tags)
    self.tags = tags.split(',').map { |tag| Tag.find_or_create_by(name: tag.strip.downcase) }
  end

  def tags_list
    tags.map(&:name).join(', ')
  end

  def self.tagged_with(tag_name)
    @tag = Tag.find_by_name!(tag_name).listings
  end

  def modify_country
    self.state = CS.states(country)[state.to_sym] || state
    self.country = CS.countries[country.to_sym] || country
  end
end
