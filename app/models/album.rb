class Album < ActiveRecord::Base

  scope :lps, -> { where(type: 'Lp') }
  scope :cds, -> { where(type: 'Cd') }

  enum condition: [ :new_condition, :used_condition ]

  belongs_to :artist
  
  def self.Types
    %w(Lp Cd)
  end
end
