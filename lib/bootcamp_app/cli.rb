

class BootcampApp::CLI  #class reponsible for running app logic

    attr_accessor :username

    def run
        welcome
        get_name
        BootcampApp::Scraper.scrape
        scraping
        home_page
        list_bootcamps
        menu
    end

    def welcome
        system "clear"
        puts ""
        puts ""
        puts "Welcome! Whats your name?"
        puts ""
    end

    def get_name
        name = gets.strip
        self.username = name
        puts ""
        puts "Nice to meet you #{self.username}!"
        puts ""
        puts "Lets get you your Top 60 Best Coding Bootcamps!".bold
        sleep(1.5)
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

    sleep(6)
    end

    def home_page
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
        puts " |      THE Course Report Best Coding Bootcamps App!      |".bold
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
            bootcamp = BootcampApp::Bootcamp.find_by_index(input.to_i - 1)
            puts BootcampApp::Scraper.scrape_two(bootcamp)
            system "clear"
            puts ""
            puts "------------------------------------------------------------------".blue
            puts "Thanks for choosing #{bootcamp.name.gsub(/(?<=[A-Za-z])(?=[A-Z])/, ' ')}!".bold
            puts ""
            puts "Bootcamp Name: ".blue.bold + bootcamp.name
            puts "Bootcamp Locations: ".blue.bold + bootcamp.locations
            puts "Rating Out of 5: ".blue.bold + bootcamp.overall_rating
            puts ""
            puts "About The Bootcamp: ".blue.bold + bootcamp.info
            puts ""
            puts "Most Recent Review: ".blue.bold + bootcamp.review
            puts ""
            puts ""
            puts "Want More? Check Out The Link Below: ".blue.bold
            puts "https://www.coursereport.com/" + bootcamp.url_link
            menu


        elsif input == "list"
            input = gets.strip
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
