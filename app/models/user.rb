class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
