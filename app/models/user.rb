class User < ApplicationRecord
  # authenticates_with_sorcery!

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :favorites_books, through: :favorites, source: :book
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction,length: {  maximum: 50 }


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  def mine?(object)
   object.user_id == id
  end
  
   def like(book)
     favorites_books << book
   end

   def unlike(book)
     favorites_books.destroy(book)
   end
  
   def favorite?(book)
     favorites_books.include?(book)
   end
end
