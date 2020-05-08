require 'colorize'

class BootcampApp::CLI  #class reponsible for running app logic

    def run
        BootcampApp::Scraper.scrape
        welcome
        list_bootcamps
        menu
    end

    def welcome
        system "clear"
        puts
        puts "                            THE ".light_blue.bold
        puts "                      CODING BOOTCAMP ".bold
        puts "                            APP ".blue.bold
        puts ""

        puts " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<".blue.bold
        puts " | Weclome To THE Course Report Best Coding Bootcamps App!|".bold
        puts " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>".blue.bold
        puts ""
        puts "----------------------------MENU--------------------------".blue.bold
        puts "  View Rankings Insert: 'list'    To Exit Insert: 'exit' "
        puts "----------------------------------------------------------"
        puts ""
    end

    def list_bootcamps
        input = gets.strip
        if input == "list"
            puts ""
            bootcamps = BootcampApp::Bootcamp.all
            bootcamps.each.with_index(1) {|bootcamp, index| puts "#{index}. #{bootcamp.name}"}

        elsif input == "exit"
            system "clear"
            puts ""
            puts "------------------------------GOODBYE!-------------------------------".blue.bold
            puts ""
            puts "Thank you for choosing the Course Report Bootcamp App!!".bold
            puts ""
            puts ""
            exit


        else
            puts ""
            puts "Check out a Bootcamp or insert exit to leave.".bold
            puts "To see a current list of Bootcamps, insert list."
            list_bootcamps
        end
    end

    def menu
        puts ""
        puts "------------------------------MENU---------------------------------".blue.bold
        puts "| Insert the number of the Bootcamp you want to learn more about!  |".bold
        puts "| To leave, insert 'exit'                                          |".bold
        puts "| To return to the Rankings, insert 'list'                         |".bold
        puts "-------------------------------------------------------------------".blue.bold
        puts ""
        input = gets.strip

        if input.to_i > 0
            bootcamp_choice = BootcampApp::Bootcamp.find_by_index(input.to_i - 1)
            system "clear"
            puts ""
            puts "------------------------------------------------------------------".blue
            puts "Thanks for choosing #{bootcamp_choice.name.gsub(/(?<=[A-Za-z])(?=[A-Z])/, ' ')}!".bold
            puts ""
            puts "Bootcamp Name: ".blue.bold + bootcamp_choice.name
            puts "Bootcamp Locations: ".blue.bold + bootcamp_choice.locations
            puts "Rating Out of 5: ".blue.bold + bootcamp_choice.overall_rating
            puts ""
            puts "About The Bootcamp: ".blue.bold + bootcamp_choice.info
            puts ""
            puts "If you still want more..... Check out the link below for more information on YOUR Bootcamp!".blue.bold
            puts "------------------------------------------------------------------".blue
            puts "https://www.coursereport.com/#{bootcamp_choice.url_link}"
            puts ""
            menu


        elsif
            input == "list"
            puts ""
            bootcamps = BootcampApp::Bootcamp.all
            bootcamps.each.with_index(1) {|bootcamp, index| puts "#{index}. #{bootcamp.name}"}
            menu

        elsif input == "exit"
            system "clear"
            puts ""
            puts "------------------------------GOODBYE!-------------------------------".blue.bold
            puts ""
            puts "Thank you for choosing the Course Report Bootcamp App!!".bold
            puts ""
            puts ""
            exit
        end
    end
end
