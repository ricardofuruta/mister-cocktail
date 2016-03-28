class Cocktail < ActiveRecord::Base
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader
end
