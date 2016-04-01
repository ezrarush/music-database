class Lp < Album
  def self.letter_present?(parent, letter)
    parent.lps.where("title ilike ?", letter + '%').count > 0 ? true : false
  end  
end
