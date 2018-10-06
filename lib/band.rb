class Band < ActiveRecord::Base
  belongs_to :user
  has_many :judges
  attr_accessor :grades

  def grades(num)
    @grades = []
    score = num
    @grades << score
  end

  def create_audience
    genres = {
      pop: {
        preferred_att1: "presentation",
        preferred_att2: "stage_presence"
      },
      rock: {
        preferred_att1: "tech_ability",
        preferred_att2: "stage_presence"
      },
      rap: {
        preferred_att1: "lyrics",
        preferred_att2: "tech_ability"
      },
      country: {
        preferred_att1: "lyrics",
        preferred_att2: "stage_presence"
      }
    }

    #Use find_by method by iterating through hash and finding it equal to self.genre

    case self.genre
    when "Pop"
      stat_hash = genres[:pop]
      stat_hash
    when "Rap"
      stat_hash = genres[:rap]
      stat_hash
    when "Rock"
      stat_hash = genres[:rock]
      stat_hash
    when "Country"
      stat_hash = genres[:country]
      stat_hash
    end

    # binding.pry

    @audience = Judge.create(name: "Audience")
    @audience.update(stat_hash)
    @audience.save
    return @audience
  end

end
