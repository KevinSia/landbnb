class Listing < ActiveRecord::Base
  belongs_to :user

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


end
