class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def notes_1=(content)
    note = Note.all.find_by(content: content)
    self.notes.include?(note) ? note : Note.create(content: content, song: self)
  end

  def notes_1
    self.notes.length != 0 ? self.notes[0] : nil
  end

  def notes_2=(content)
    note = Note.all.find_by(content: content)
    self.notes.include?(note) ? note : Note.create(content: content, song: self)
  end

  def notes_2
    self.notes.length != 0 ? self.notes[1] : nil
  end
end
