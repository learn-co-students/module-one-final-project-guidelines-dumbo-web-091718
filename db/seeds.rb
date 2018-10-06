User.destroy_all
Band.destroy_all
Judge.destroy_all
Response.destroy_all

hanaa = User.create(name: "Hanaa")
donovan = User.create(name: "Donovan")
raj = User.create(name: "Raj")
christine = User.create(name: "Christine")

band1 = hanaa.bands.create(name: "Kings of Leon", genre: "Rock", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
band2 = hanaa.bands.create(name: "Portugal. The Man", genre: "Rock", tech_ability: 2, presentation: 1, lyrics: 4, stage_presence: 3)
band3 = hanaa.bands.create(name: "Drake", genre: "Rap", tech_ability: 1, presentation: 4, lyrics: 3, stage_presence: 2)
band4 = donovan.bands.create(name: "Friday and the Thirteenths", genre: "Rock", tech_ability: 3, presentation: 2, lyrics: 1, stage_presence: 4)
band5 = donovan.bands.create(name: "Born to Hulu", genre: "Pop", tech_ability: 2, presentation: 3, lyrics: 4, stage_presence: 1)


cpu = User.create(name: "CPU")

cpuband1 = cpu.bands.create(name: "KoRn", genre: "Rock", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
cpuband2 = cpu.bands.create(name: "Pavement", genre: "Rock", tech_ability: 4, presentation: 2, lyrics: 3, stage_presence: 1)
cpuband3 = cpu.bands.create(name: "Alvvays", genre: "Rock", tech_ability: 2, presentation: 3, lyrics: 4, stage_presence: 1)
cpuband4 = cpu.bands.create(name: "Cloud Nothings", genre: "Rock", tech_ability: 2, presentation: 1, lyrics: 4, stage_presence: 3)
cpuband5 = cpu.bands.create(name: "Queens of the Stone Age", genre: "Rock", tech_ability: 3, presentation: 4, lyrics: 1, stage_presence: 2)
cpuband6 = cpu.bands.create(name: "The Distillers", genre: "Rock", tech_ability: 1, presentation: 4, lyrics: 2, stage_presence: 3)
cpuband7 = cpu.bands.create(name: "The Garden", genre: "Rock", tech_ability: 3, presentation: 2, lyrics: 1, stage_presence: 4)
cpuband8 = cpu.bands.create(name: "Japanese Breakfast", genre: "Rock", tech_ability: 2, presentation: 1, lyrics: 4, stage_presence: 3)
cpuband9 = cpu.bands.create(name: "iceage", genre: "Rock", tech_ability: 2, presentation: 3, lyrics: 4, stage_presence: 1)
cpuband10 = cpu.bands.create(name: "Screaming Females", genre: "Rock", tech_ability: 3, presentation: 1, lyrics: 2, stage_presence: 4)

cpuband11 = cpu.bands.create(name: "Frank Ocean", genre: "Pop", tech_ability: 3, presentation: 2, lyrics: 4, stage_presence: 1)
cpuband12 = cpu.bands.create(name: "Grimes", genre: "Pop", tech_ability: 2, presentation: 4, lyrics: 3, stage_presence: 1)
cpuband13 = cpu.bands.create(name: "Taylor Swift", genre: "Pop", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
cpuband14 = cpu.bands.create(name: "Jeff Buckley", genre: "Pop", tech_ability: 4, presentation: 1, lyrics: 3, stage_presence: 2)
cpuband15 = cpu.bands.create(name: "Kero Kero Bonito", genre: "Pop", tech_ability: 2, presentation: 4, lyrics: 1, stage_presence: 3)
cpuband16 = cpu.bands.create(name: "Britney Spears", genre: "Pop", tech_ability: 2, presentation: 3, lyrics: 1, stage_presence: 4)
cpuband17 = cpu.bands.create(name: "Christina Aguilera", genre: "Pop", tech_ability: 4, presentation: 2, lyrics: 1, stage_presence: 3)
cpuband18 = cpu.bands.create(name: "Lady Gaga", genre: "Pop", tech_ability: 4, presentation: 2, lyrics: 1, stage_presence: 3)
cpuband19 = cpu.bands.create(name: "Neutral Milk Hotel", genre: "Pop", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
cpuband20 = cpu.bands.create(name: "Justin Timberlake", genre: "Pop", tech_ability: 2, presentation: 3, lyrics: 1, stage_presence: 4)

cpuband21 = cpu.bands.create(name: "Lil Uzi Vert", genre: "Rap", tech_ability: 1, presentation: 4, lyrics: 2, stage_presence: 3)
cpuband22 = cpu.bands.create(name: "Eminem", genre: "Rap", tech_ability: 4, presentation: 1, lyrics: 3, stage_presence: 2)
cpuband23 = cpu.bands.create(name: "Drake", genre: "Rap", tech_ability: 1, presentation: 4, lyrics: 3, stage_presence: 2)
cpuband24 = cpu.bands.create(name: "Kanye West", genre: "Rap", tech_ability: 2, presentation: 4, lyrics: 1, stage_presence: 3)
cpuband25 = cpu.bands.create(name: "6ix9ine", genre: "Rap", tech_ability: 2, presentation: 4, lyrics: 1, stage_presence: 3)
cpuband26 = cpu.bands.create(name: "Tyler, The Creator", genre: "Rap", tech_ability: 1, presentation: 4, lyrics: 2, stage_presence: 3)
cpuband27 = cpu.bands.create(name: "Nicki Minaj", genre: "Rap", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
cpuband28 = cpu.bands.create(name: "Smokepurpp", genre: "Rap", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
cpuband29 = cpu.bands.create(name: "Lil Pump", genre: "Rap", tech_ability: 2, presentation: 4, lyrics: 1, stage_presence: 3)
cpuband30 = cpu.bands.create(name: "Kodak Black", genre: "Rap", tech_ability: 3, presentation: 1, lyrics: 4, stage_presence: 2)

cpuband31 = cpu.bands.create(name: "Lady Antebellum", genre: "Country", tech_ability: 1, presentation: 4, lyrics: 3, stage_presence: 2)
cpuband32 = cpu.bands.create(name: "Blake Shelton", genre: "Country", tech_ability: 1, presentation: 3, lyrics: 2, stage_presence: 4)
cpuband33 = cpu.bands.create(name: "Jason Aldean", genre: "Country", tech_ability:1 , presentation: 4, lyrics: 2, stage_presence: 3)
cpuband34 = cpu.bands.create(name: "Tim McGraw", genre: "Country", tech_ability: 3, presentation: 2, lyrics: 4, stage_presence: 1)
cpuband35 = cpu.bands.create(name: "Brooks & Dunn", genre: "Country", tech_ability: 2, presentation: 1, lyrics: 4, stage_presence: 3)
cpuband36 = cpu.bands.create(name: "Dierks Bentley", genre: "Country", tech_ability: 3, presentation: 2, lyrics: 4, stage_presence: 1)
cpuband37 = cpu.bands.create(name: "Kenny Chesney", genre: "Country", tech_ability: 1, presentation: 4, lyrics: 3, stage_presence: 2)
cpuband38 = cpu.bands.create(name: "Brad Paisley", genre: "Country", tech_ability: 4, presentation: 3, lyrics: 1, stage_presence: 2)
#
# Judge.create(name: "Simon Cowell", preferred_att1: "tech_ability", preferred_att2: "presentation")
# Judge.create(name: "Paula Abdul", preferred_att1: "stage_presence", preferred_att2: "lyrics")
# Judge.create(name: "Randy Jackson", preferred_att1: "lyrics", preferred_att2: "presentation")
#Creating Judges
simon = Judge.create(name: "Simon Cowell", preferred_att1: "technical ability", preferred_att2: "presentation")
paula = Judge.create(name: "Paula Abdul", preferred_att1: "stage_presence", preferred_att2: ["tech_ability", "presentation", "lyrics"].sample)
randy = Judge.create(name: "Randy Jackson", preferred_att1: "lyrics", preferred_att2: "presentation")
# audience = Judge.find_by(name: "Audience")

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

# bad = Response.create(judge: randy, content: "Awful", score: 0)
# ok = Response.create(judge: randy, content: "Do Better", score: 1)
# good = Response.create(judge: randy, content: "Amazing", score: 2)
