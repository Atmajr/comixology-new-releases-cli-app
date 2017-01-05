require_relative '../config/environment.rb'

class CommandLineInterface

  def run
  end

  def make_issues
    issues_array = Scraper.scrape_release_page
    add_attributes_to_issues
  end

  def display_issues
  end

  def add_attributes_to_issues
  end

end
