require_relative("../models/artist.rb")
require_relative("../models/album.rb")

require("pry-byebug")

# Artist.delete_all()

artist1 = Artist.new({
  "name" => "Oasis"
  })

artist2 = Artist.new({
  "name" => "Blur"
  })

artist3 = Artist.new({
    "name" => "Ultraista"
    })

artist4 = Artist.new({
  "name" => "FKJ"
  })

  artist5 = Artist.new({
  "name" => "Mark Ronson"
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()

album1 = Album.new({
  "title" => "What's the story, Morning Glory",
  "stock" => 100,
  "artist_id" => artist1.id
  })
album2 = Album.new({
  "title" => "Dig out your soul",
  "stock" => 160,
  "artist_id" => artist1.id
  })
album3 = Album.new({
  "title" => "Definatly Maybe",
  "stock" => 40,
  "artist_id" => artist1.id
  })
album4 = Album.new({
  "title" => "The Magic Whip",
  "stock" => 10,
  "artist_id" => artist2.id
  })

  album5 = Album.new({
    "title" => "Parklife",
    "stock" => 100,
    "artist_id" => artist2.id
    })

# album5 = Album.new({
#   "title" => "Parklife,
#   "stock" => 100,
#   "artist_id" => artist2.id
#   })

album6 = Album.new({
  "title" => "The Great Escape",
  "stock" => 100,
  "artist_id" => artist2.id
  })

album7 = Album.new({
  "title" => "Ultraist",
  "stock" => 1,
  "artist_id" => artist3.id
  })
album8 = Album.new({
  "title" => "French Kiwi Juice",
  "stock" => 40,
  "artist_id" => artist4.id
  })
album9 = Album.new({
  "title" => "Someone to Love me",
  "stock" => 10,
  "artist_id" => artist5.id
  })
album10 = Album.new({
  "title" => "Here come's the fuzz",
  "stock" => 10,
  "artist_id" => artist5.id
  })
album11 = Album.new({
  "title" => "Stop Me",
  "stock" => 10,
  "artist_id" => artist5.id
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()
album10.save()
album11.save()





binding.pry
nil
