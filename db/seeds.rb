User.create(name: "jinx", password: 'gotyou')
User.create(name: 'lux', password: 'shineon')

Wall.create(name: "FlatIron School")
Wall.create(name: "The Great Wall")

Message.create(content: "The Great Wall is on fire", user_id: 1, wall_id:2)
Message.create(content: "The Great Wall is still on fire", user_id: 2, wall_id: 2)
