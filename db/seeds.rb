User.destroy_all
Band.destroy_all
Judge.destroy_all
Response.destroy_all

hanaa = User.create(name: "Hanaa")
donovan = User.create(name: "Donovan")
raj = User.create(name: "Raj")
christine = User.create(name: "Christine")

band1 = hanaa.bands.create(name: "Kings of Leon", genre: "Rock", tech_ability: 4, presentation: 3, stage_presence: 1, lyrics: 2)
band2 = hanaa.bands.create(name: "Portugal. The Man", genre: "Rock", tech_ability: 1, presentation: 2, stage_presence: 3, lyrics: 4)
band3 = hanaa.bands.create(name: "Drake", genre: "Rock", tech_ability: 3, presentation: 1, stage_presence: 4, lyrics: 2)

#Creating Judges
simon = Judge.create(name: "Simon Cowell", preferred_att1: "technical ability", preferred_att2: "presentation")
paula = Judge.create(name: "Paula Abdul", preferred_att1: "stage_presence", preferred_att2: ["tech_ability", "presentation", "lyrics"].sample)
randy = Judge.create(name: "Randy Jackson", preferred_att1: "lyrics", preferred_att2: "presentation")

#Simon Response
bad = Response.create(judge: simon, content: "Oh God, I thought that was absolutely dreadful", score: 0)
ok = Response.create(judge: simon, content: "Although it was good...", score: 1)
good = Response.create(judge: simon, content: "I'm so, so pleased", score: 2)

#Paula Response
bad = Response.create(judge: paula, content: "Awful", score: 0)
ok = Response.create(judge: paula, content: "It was okay", score: 1)
good = Response.create(judge: paula, content: "That was amazing", score: 2)
#

#Randy Response
bad = Response.create(judge: randy, content: "Bad", score: 0)
ok = Response.create(judge: randy, content: "Eh", score: 1)
good = Response.create(judge: randy, content: "Awesome", score: 2)
