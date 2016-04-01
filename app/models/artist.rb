class Artist < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :albums, dependent: :restrict_with_error
  has_many :lps
  has_many :cds

  def self.letter_present?(letter)
    Artist.where("name ilike ?", letter + '%').count > 0 ? true : false
  end
end
