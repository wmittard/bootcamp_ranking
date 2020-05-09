require 'colorize'

class BootcampApp::CLI  #class reponsible for running app logic


    def run
        BootcampApp::Scraper.scrape
        scraping
        # more_info
        welcome
        list_bootcamps
        menu
    end


    def scraping
        system "clear"
        puts " "
        puts ""
        puts "



                          -------------------------------------------------- \                                           \
                         |     _________________________________________    |
                         |   |                                         |    |
                         |   |  WELCOME TO THE CODING BOOTCAMP APP     |    |
                         |   |                                         |    |
                         |   |  WE ARE SCRAPING.....                   |    |
                         |   |       THIS MAY TAKE A MINUTE            |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |                                         |    |
                         |   |_________________________________________|    |
                         |                                                  |
                         |\ _________________________________________________|
                                \___________________________________
                            ___________________________________________
                         _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
                       _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
                   _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
                _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
             _-'.-.-.-.-.-. .---.-. .-------------------------. .-.---. .---.-.-.-.`-_
            :-------------------------------------------------------------------------:
            `---._.-------------------------------------------------------------._.---'  ".blue.bold

        sleep(10)










    end




    def welcome
        system "clear"
        puts "                            THE ".light_blue.bold
        puts "                      CODING BOOTCAMP ".bold
        puts "                            APP ".blue.bold
        puts ""
        puts "


                          ___
                        /` ,-\      _ ___
                        |_c  '>    |-|   |._
                         )_ _/     | |   |  |
                [___]    /  `\____  | |   |_,'
                |  ^|  /  \_____/)  |-|___|
                |   | /    /   _:::_))_(___
                |   |/`-._/_   |___________|
                `-;_|\_____ `\   ||"""""""""||"
                 | '######|_|_||         ||'
                  \ ._  _,'{~-_}|         ||
                      _)   (   {-__}|         ||
                     /______\ |_,__)          ||".bold










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
            puts "ERROR: Please insert a valid command"
            list_bootcamps
        end
    end

    # def more_info
    #     @bootcamp = BootcampApp::Bootcamp.all
    #     @bootcamp.each do |bootcamp|
    #         BootcampApp::Scraper.scrape_two(bootcamp)
    #     end
    # end

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
            puts "About The Bootcamp: ".blue.bold + bootcamp_choice.about
            puts ""
            # puts "Most Recent Review: ".blue.bold + bootcamp_choice.review
            # puts ""
            puts ""
            puts "Want More? Check Out The Link Below: ".blue.bold
            puts "https://www.coursereport.com/" + bootcamp_choice.url_link
            menu


        elsif input == "list"
            puts ""
            bootcamps = BootcampApp::Bootcamp.all
            bootcamps.each.with_index(1) {|bootcamp, index| puts "#{index}. #{bootcamp.name}"}
            menu

        else input == "exit"
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
