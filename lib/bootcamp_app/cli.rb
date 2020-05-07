require 'colorize'

class BootcampApp::CLI  #class reponsible for running app logic

    def run
        BootcampApp::Scraper.scrape
        welcome
        list_bootcamps
        menu
    end

    def welcome
        puts ""
        puts "                                                       ".blue.bold
        puts " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<".blue.bold
        puts " | Weclome To THE Course Report Best Coding Bootcamps App!|".blue.bold
        puts " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>".blue.bold
        puts ""
        puts "------------------------------MENU--------------------------------".blue.bold
        puts "To see a current list of the Top 60 Best Coding Bootcamps, type list!".bold
        puts "To leave, type exit."
        puts ""
    end

    def list_bootcamps
        input = gets.strip
        if input == "list"
            puts ""
            bootcamps = BootcampApp::Bootcamp.all
            bootcamps.each.with_index(1) {|bootcamp, index| puts "#{index}. #{bootcamp.name}"}
        elsif input == "exit"
            #system "clear" or system "cls"
            exit
        else
            puts ""
            puts "Check out a Bootcamp or type exit to leave.".bold
            puts "To see a current list of Bootcamps, type list."
            list_bootcamps
        end
    end

    def menu
        puts ""
        puts "------------------------------MENU--------------------------------".blue.bold
        puts "Select another Bootcamp you wish to learn more about!".blue.bold
        puts "To leave, type exit"
        puts ""
        input = gets.strip

        if input.to_i > 0
            bootcamp_choice = BootcampApp::Bootcamp.find_by_index(input.to_i - 1)
            puts ""
            puts "------------------------------------------------------------------"
            puts "Choose YOUR Coding Bootcamp!".bold.blue
            puts ""
            puts "Bootcamp Name: ".bold + bootcamp_choice.name
            puts "Bootcamp Locations: ".bold + bootcamp_choice.locations
            puts "Rating Out of 5: ".bold + bootcamp_choice.overall_rating
            puts ""
            puts "About The Bootcamp: ".bold + bootcamp_choice.info
            puts ""
            puts "Want to learn more? Check out the link below for more information on YOUR Bootcamp!".bold
            puts "#{bootcamp_choice.url_link}"
            menu
        elsif
            input == "exit"
            puts ""
            puts "------------------------------GOODBYE!-------------------------------".blue.bold
            puts ""
            puts "Thank you for choosing the Course Report Bootcamp App!!".bold
            puts ""
            puts ""
        else
            puts "ERROR: Please type a number to see another Bootcamp or type 'exit' to leave"
            menu
        end
    end
end
