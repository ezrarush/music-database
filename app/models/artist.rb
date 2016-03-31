class Artist < ActiveRecord::Base
  has_many :albums, dependent: :restrict_with_error
  has_many :lps
  has_many :cds

  validates :name, presence: true  
end
