User.destroy_all
Band.destroy_all

hanaa = User.create(name: "Hanaa")
donovan = User.create(name: "Donovan")
raj = User.create(name: "Raj")
christine = User.create(name: "Christine")

band1 = hanaa.bands.create(name: "Kings of Leon")
band2 = hanaa.bands.create(name: "Portugal. The Man")
band3 = hanaa.bands.create(name: "Drake")
