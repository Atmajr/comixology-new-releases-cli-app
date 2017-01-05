class Issue

  attr_reader :title, :price, :description, :author, :artist, :publisher

  @@all = []

  def initialize(title, price, description, author, artist, publisher)
    @title = title
    @price = price
    @description = description
    @author = author
    @artist = artist
    @publisher = publisher
    @@all << self
  end

  def  self.all
    @@all
  end

  def self.create_from_collection
  end

  def add_issue_attributes
  end

end
