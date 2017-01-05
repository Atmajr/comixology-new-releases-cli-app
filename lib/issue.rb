class Issue

  attr_reader :title, :price, :description, :author, :artist, :publisher

  @@all = []

  def initialize(issue_hash)

    issue_hash.each do |key, value|
      self.send("#{key}=", value)
    end

    @@all << self

    # @title = title
    # @price = price
    # @description = description
    # @author = author
    # @artist = artist
    # @publisher = publisher

  end

  def  self.all
    @@all
  end

  def self.create_from_collection(issues_array)
    issues_array.each do |issue|
      new_issue = Issue.new(issue)
    end
  end

  def add_issue_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      self.send("{key=}", value)
    end
  end

end
