class Genre < ActiveRecord::Base
  has_and_belongs_to_many :albums
  has_many :lps, through: :albums
  
  validates :name, presence: true
end
