class Cd < Album;
  def self.letter_present?(parent, letter)
    parent.cds.where("title ilike ?", letter + '%').count > 0 ? true : false
  end
end
