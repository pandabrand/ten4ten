class Image < ActiveRecord::Base
  attr_accessible :filename, :name
  
  belongs_to :album
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :album_id, presence: true
end
