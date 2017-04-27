require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Janis Joplin"})
artist1.save()
artist2 = Artist.new({"name" => "Pink Floyd"})
artist2.save()
artist3 = Artist.new({"name" => "Deep Purple"})
artist3.save()
artist4 = Artist.new({"name" => "Queen"})
artist4.save()
artist5 = Artist.new({"name" => "Rolling Stones"})
artist5.save()

# artist3.delete()
artist4.update()

album1 = Album.new({
  "title" => "Pearl",
  "genre" => "Blues",
  "artist_id" => artist1.id
  })
album1.save()

album2 = Album.new({
  "title" => "The Wall",
  "genre" => "Classic Rock",
  "artist_id" => artist2.id
  })
album2.save()

album3 = Album.new({
  "title" => "Deep Purple in Rock",
  "genre" => "Progressive Rock",
  "artist_id" => artist3.id
  })
album3.save()

album4 = Album.new({
  "title" => "A kind of Magic",
  "genre" => "Rock",
  "artist_id" => artist4.id
  })
album4.save()

album5 = Album.new({
  "title" => "The Rolling Stones",
  "genre" => "Baroque Pop",
  "artist_id" => artist5.id

  })
album5.save()

# album3.delete()
album4.update()

Album.all()
Artist.all()

# artist = Artist.new({"name" => "Bon Jovi"})

# artist.save()
# artist.update()
# artist.delete()

# Artist.find(1)
# Artist.all()

binding.pry
nil