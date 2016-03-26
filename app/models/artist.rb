class Artist < ActiveRecord::Base

  has_many :albums
  has_many :lps
  has_many :cds  
end
