require_relative '../config/environment.rb'

class Scraper

  def self.scrape_release_page(release_url = "https://www.comixology.com/new-comics")
    #we'll default to the main new release page, but passing a variable instead of hard coding will make it easier to change if comixology
    #changes their setup, and will also allow for expansion later
    page = Nokogiri::HTML(open(release_url))
    issues = []
    counter = 0
    #binding.pry

    page.css('.content-item').each do |item|
      issues[counter] = {
        :price => item.css('.item-actions-container').attr('data-price').text,
        :url => item.css('.content-details').attr('href').text,
        :title => item.css('.content-details').attr('title').text
      }
      counter += 1
      #binding.pry
    end

    issues

  end

  def self.scrape_issue_page(issue_url)
    issue_uri = Addressable::URI.parse(issue_url)
    parse_path = "https://www.comixology.com/" + issue_uri.normalized_path
    page = Nokogiri::HTML(open(parse_path))
    issue_hash = Hash.new
    #issue_symbol = page.css("#column2 .title[itemprop='name']").text.to_sym
    #issue_title = page.css("#column2 .title[itemprop='name']").text
    #issue_price = page.css('.item-price').text
    issue_hash[:description] = page.css('.item-description').text
    issue_hash[:author] = page.css("h2[title='Written by']").text.delete("\n").delete("\t").split.join(" ") #remove newlines, tabs and double spaces
    issue_hash[:artist] = page.css("h2[title='Art by']").text.delete("\n").delete("\t").split.join(" ")
    issue_hash[:publisher] = page.css("h3[title='Publisher']").text.delete("\n").delete("\t").split.join(" ")
    #new_issue = Issue.new(issue_title, issue_price, issue_description, issue_author, issue_artist, issue_publisher)
    #binding.pry
    #new_issue
    issue_hash

  end

end
