require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_release_page(release_url)
    page = Nokogiri::HTML(open(release_url))
    issues = []
    counter = 0
  end

  def self.scrape_issue_page(issue_url)
  end

end
