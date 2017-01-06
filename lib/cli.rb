require_relative '../config/environment.rb'

class CommandLineInterface

  def run
    make_issues
    #add_attributes_to_issues
    puts "Welcome to the Comixology New Release Extractor"
    command = "0"
    while (command != "3") do
      puts "1.) List new releases"
      puts "2.) Get more info about a release"
      puts "3.) Exit this program"
      puts "Please enter a number:"
      command = gets.chomp!
      case command
        when "1"
          list_issues
        when "2"
          display_issue
        when "3"
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

  def display_issue
    total_releases = list_issues
    input_is_valid = false
    while !input_is_valid do
      puts "Please enter the number of the issue you'd like to know more about:"
      display_input = gets.chomp!.to_i
      if display_input.between?(1,total_releases) then
        chosen_issue = Issue.all[display_input - 1]
        if chosen_issue.description == nil then
          attributes_hash = Scraper.scrape_issue_page(chosen_issue.url)
          chosen_issue.add_issue_attributes(attributes_hash)
        end
        #binding.pry
        puts "------"
        puts "Title: #{chosen_issue.title}"
        puts "Price: #{chosen_issue.price}"
        puts "Description: #{chosen_issue.description}"
        puts "Author: #{chosen_issue.author}"
        puts "Artist: #{chosen_issue.artist}"
        puts "Publisher: #{chosen_issue.publisher}"
        puts "------"
        input_is_valid = true
      else
        puts "Invalid input. Try again."
      end
    end
  end

  def add_attributes_to_issues
    Issue.all.each do |issue|
      attributes = Scraper.scrape_issue_page(issue.url)
      issue.add_issue_attributes(attributes)
    end
  end

  def list_issues
    #binding.pry
    number_of_releases = 0
    Issue.all.each do |issue|
      number_of_releases += 1
      count = Issue.all.index(issue) + 1
      puts "#{count}.) #{issue.title} - #{issue.price}"
    end
    puts "------"
    number_of_releases
  end

end
