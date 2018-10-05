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
bad = Response.create(judge: simon, content: "Absolutely Dreadful", score: 0)
ok = Response.create(judge: simon, content: "Although it was good", score: 1)
good = Response.create(judge: simon, content: "Im pleased", score: 2)

#Paula Response
bad = Response.create(judge: paula, content: "Oh boy", score: 0)
ok = Response.create(judge: paula, content: "I dont know", score: 1)
good = Response.create(judge: paula, content: "You gave us chills", score: 2)
#

#Randy Response
bad = Response.create(judge: randy, content: "It was a little weird", score: 0)
ok = Response.create(judge: randy, content: "It was alright", score: 1)
good = Response.create(judge: randy, content: "It was kinda hot", score: 2)

#Audience response
bad = Response.create(judge: randy, content: "Awful", score: 0)
ok = Response.create(judge: randy, content: "Do Better", score: 1)
good = Response.create(judge: randy, content: "Amazing", score: 2)
