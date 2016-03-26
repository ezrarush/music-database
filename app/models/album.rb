class Album < ActiveRecord::Base

  scope :lps, -> { where(type: 'Lp') }
  scope :cds, -> { where(type: 'Cd') }

  enum condition: [ :new, :used ]
  
  def self.Types
    %w(Lp Cd)
  end
end
