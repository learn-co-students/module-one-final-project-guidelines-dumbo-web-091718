require 'pry'

class Judge < ActiveRecord::Base
  has_many :bands
  has_many :responses

  # pid = fork{ exec 'afplay', "../Audio/Absolutely_Dreadful.mp3"}
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

  def judge_responses
    self.responses.map {|response| response.content}
    # binding.pry
  end

  def evaluate_scores(band)
    responses = self.judge_responses

    score = self.grade(band)


    def change_name(response)
      # binding.pry
      response = response.split(" ").join("_")
      # binding.pry
      pid = fork{ exec 'afplay', "./sound/#{response}.mp3"}
    end


    # binding.pry
    if score >= 8
      puts responses[-1]
      change_name(responses[-1])
      return responses[-1]
    elsif score <= 3
      puts responses[0]
      change_name(responses[0])
      # binding.pry
      # pid = fork{ exec 'afplay', "./sound/#{change_name(responses[0])}.mp3"}
      return responses[0]

    else
      puts responses[1]
      change_name(responses[1])
      # binding.pry
      # pid = fork{ exec 'afplay', "./sound/#{change_name(responses[1])}.mp3"}
      return responses[1]
    end

  end
end
