require_relative '../config/environment.rb'

class CommandLineInterface

  def run
  end

  def make_issues
    issues_array = Scraper.scrape_release_page
  end

  def display_issues
  end

end
