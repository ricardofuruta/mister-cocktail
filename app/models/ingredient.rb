class Ingredient < ActiveRecord::Base
  belongs_to :cocktail
  has_many :doses
  validates :name, uniqueness: true, presence: true
end
