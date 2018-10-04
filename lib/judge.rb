require 'pry'

class Judge < ActiveRecord::Base
  has_many :bands
  has_many :responses

  def grade(band)
    band_hash = {
      stage_presence: band.stage_presence,
      presentation: band.presentation,
      tech_ability: band.tech_ability,
      lyrics: band.lyrics
    }

    score = 0

    x = band_hash[self.preferred_att1.to_sym]
    y = band_hash[self.preferred_att2.to_sym]

    if x == 4
       score += 5
    end
    if y >= 3
      score += 3
    end
    if x == 3
      score += 3
    end

    score += 2
  #  binding.pry
    score
  end

end
