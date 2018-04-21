require_relative("../models/artist.rb")

require("pry-byebug")

Artist.delete_all()

artist1 = Artist.new({
    "name" => "Oasis"
})

artist2 = Artist.new({
  "name" => "Blur"
  })

  artist3 = Artist.new({
    "name" => "The Dandy Warhols"
  })

  artist4 = Artist.new({
    "name" => "David Bowie"
    })

    artist5 = Artist.new({
      "name" => "Miles Davis"
      })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()

binding.pry
nil
