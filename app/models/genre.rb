class Genre < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :albums
  has_many :lps, through: :albums
  
  def self.letter_present?(letter)
    Genre.where("name ilike ?", letter + '%').count > 0 ? true : false
  end
end
