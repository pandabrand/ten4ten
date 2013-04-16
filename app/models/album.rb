class Album < ActiveRecord::Base
  attr_accessible :name, :post_date
  belongs_to :user
  has_many :images
  
  validates :user_id, presence: true
  validates :name, presence: true
  validate :image_limit

  private
  
  def image_limit
    self.errors.add(:images, "Too many images.") if images.size > 10
  end
  
end
