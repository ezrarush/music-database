class Album < ActiveRecord::Base

  validates :title, :artist_id, presence: true
  
  scope :lps, -> { where(type: 'Lp') }
  scope :cds, -> { where(type: 'Cd') }

  enum condition: [ :new_condition, :used_condition ]

  belongs_to :artist
  has_and_belongs_to_many :genres
  
  def self.types
    %w(Lp Cd)
  end

  def self.letter_present?(letter)
    Album.where("title ilike ?", letter + '%').count > 0 ? true : false
  end
end
