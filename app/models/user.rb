class User < ActiveRecord::Base
  include Clearance::User

  validates :gender, inclusion: { in: %w(M F) }
  validates :description, length: { maximum: 140 }

end
