require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_release_page(release_url = "https://www.comixology.com/new-comics")
    #we'll default to the main new release page, but passing a variable instead of hard coding will make it easier to change if comixology
    #changes their setup, and will also allow for expansion later
    page = Nokogiri::HTML(open(release_url))
    issues = []
    counter = 0
    #binding.pry

    page.css('.content-item').each do |item|
      binding.pry
    end

  end

  def self.scrape_issue_page(issue_url)
  end

end
