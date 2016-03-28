class Review < ActiveRecord::Base
  belongs_to: cocktail
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :rate, presence: true
end
