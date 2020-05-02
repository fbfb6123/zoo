class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :animals
  has_many :facilities, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_facilities, through: :likes, source: :post
  has_many :facilities, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_animals, through: :favorites, source: :animal
  has_many :animals, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :name_kana, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
  validates :city, presence: true, uniqueness: true
  validates :city_adress, presence: true, uniqueness: true
  validates :birthday, presence: true, uniqueness: true
  def already_liked?(facility)
    self.likes.exists?(facility_id: facility.id)
  end

  def already_favorited?(animal)
    self.favorites.exists?(animal_id: animal.id)
  end
end
