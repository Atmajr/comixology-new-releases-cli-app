require_relative '../config/environment.rb'

class CommandLineInterface

  def run
    make_issues
    add_attributes_to_issues
  end

  def make_issues
    issues_array = Scraper.scrape_release_page
    add_attributes_to_issues
  end

  def display_issues
  end

  def add_attributes_to_issues
    Issue.all.each do |issue|
      attributes = Scraper.scrape_issue_page(issue.url)
      issue.add_issue_attributes(attributes)
    end
  end

end
