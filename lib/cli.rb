require_relative '../config/environment.rb'

class CommandLineInterface

  def run
    make_issues
    add_attributes_to_issues
    puts "Welcome to the Comixology New Release Extractor"
    puts "Please enter a number:"
    command = "0"
    while (command != "4") do
      puts "1.) List new releases"
      puts "2.) Get more info about a release"
      puts "3.) Display basic some basic help"
      puts "4.) Exit this program"
      command = gets.chomp!
      case command
        when "1"
          list_issues
        when "2"
        when "3"
        when "4"
          puts "Thank you for using the Comixology New Release Extractor!"
        else
          puts "Invalid command. Please try again."
      end
    end
  end

  def make_issues
    issues_array = Scraper.scrape_release_page
    Issue.create_from_collection(issues_array)
  end

  def display_issues
  end

  def add_attributes_to_issues
    Issue.all.each do |issue|
      attributes = Scraper.scrape_issue_page(issue.url)
      issue.add_issue_attributes(attributes)
    end
  end

  def list_issues
    #binding.pry
    Issue.all.each do |issue|
      count = Issue.all.index(issue) + 1
      puts "#{count}.) #{issue.title} - #{issue.price}"
    end
    puts "------"
  end

end
